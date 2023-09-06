import 'package:breaking_bad/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/constants/mycolor.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
 late List<Character>allCharacters;
 late List<Character>searchedForCharacters;
 bool isSearching=false;
 final searchTextController=TextEditingController();

 Widget buildSearchField(){
   return TextField(
     controller: searchTextController,
     cursorColor: MyColor.Mygrey,
     decoration: InputDecoration(hintText: 'Find a Character',border: InputBorder.none,hintStyle: TextStyle(color:MyColor.Mygrey,fontSize: 18 )),
style: TextStyle(color: MyColor.Mygrey,fontSize: 18),
   onChanged: (searchCharacter) {
     addSearchedForItemToSearchedList(searchCharacter);
   },
   );
 }
 void addSearchedForItemToSearchedList(String searchCharacter) {
   searchedForCharacters=allCharacters.where((character) =>character.name!.toLowerCase().startsWith(searchCharacter)).toList();
 setState(() {});
 }
 List <Widget> buildAppBarActions(){
   if(isSearching){
     return [
       IconButton(onPressed: (){
         clearSearch();
         Navigator.pop(context);
       }, icon: Icon(Icons.clear,color: MyColor.Mygrey,))
     ];
   }else{
     return [
       IconButton(
           onPressed:startSearching
           , icon:Icon(Icons.search,color: MyColor.Mygrey,))
     ];
   }
 }
 void startSearching() {
  ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));

  setState(() {
    isSearching=true;
  });
 }
 void stopSearching() {
   clearSearch();
   setState(() {
     isSearching=false;
   });
 }
 void clearSearch() {
   setState(() {
     searchTextController.clear();
   });
 }
 Widget buildAppBarTitle(){
   return Text('Characters',style: TextStyle(color: MyColor.Mygrey),);
 }
 @override
  void initState() {
    super.initState();
    allCharacters=BlocProvider.of<CharactersCubit>(context).getAllCharater();
  }

  Widget buildBlocWidget(){
   return BlocBuilder<CharactersCubit,CharactersState>(builder:(context,state){
     if(state is Charactersloaded){
   allCharacters=(state).characters;
   return buildLoadedListWidgets();
     }else{
return showLoadingIndicator();
     }
   } );
  }
  Widget showLoadingIndicator(){
   return Center(child: CircularProgressIndicator(
     color: MyColor.myYellow,
   ),);
  }
  Widget buildLoadedListWidgets(){
   return SingleChildScrollView(
     child:Container(
       color: MyColor.Mygrey,
       child: Column(
         children: [
           buildCharactersList(),
         ],
       ),
     ) ,
   );
  }
  Widget buildCharactersList(){
   return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
     crossAxisCount: 2,
     childAspectRatio: 2/3,
     crossAxisSpacing: 1,
       mainAxisSpacing: 1,
   ),
       shrinkWrap: true,
       physics: ClampingScrollPhysics(),
       padding: EdgeInsets.zero,
       itemCount:searchTextController.text.isEmpty? allCharacters.length:searchedForCharacters.length,
       itemBuilder: (ctx,index){
     return CharacterItem(character:searchTextController.text.isEmpty? allCharacters[index]:searchedForCharacters[index],);
       });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: isSearching?BackButton(color: MyColor.Mygrey,):Container(),
        backgroundColor: MyColor.myYellow,
        title: isSearching ? buildSearchField() : buildAppBarTitle(),
        actions: buildAppBarActions(),

      ),
body:buildBlocWidget(),
    );
  }
}