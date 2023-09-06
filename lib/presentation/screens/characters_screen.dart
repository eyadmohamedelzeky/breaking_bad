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
       itemCount: allCharacters.length,
       itemBuilder: (ctx,index){
     return CharacterItem(character: allCharacters[index],);
       });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.myYellow,
        title: Text('Characters',style: TextStyle(color: MyColor.Mygrey),),
      ),
body:buildBlocWidget(),
    );
  }
}