import 'package:breaking_bad/constants/mycolor.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.Mygrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(delegate:SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  characterInfo('Job :',character.episode!.join(' /')),
                  buildDivider(315),
                  characterInfo('Species :',character.species),
                  buildDivider(315),
                  characterInfo('Status :',character.status),
                  buildDivider(315),
                  characterInfo('name :',character.name),

                ],
              ),
            ),
            SizedBox(
              height: 700,
            ),
          ])),
        ],
      ),
    );
  }

Widget  buildSliverAppBar() {
    return SliverAppBar(expandedHeight: 600,pinned: true,stretch: true,
    backgroundColor: MyColor.Mygrey,flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Text(character.name,style: TextStyle(color: MyColor.Mywhite),textAlign: TextAlign.start,
      ),
        background: Hero(
          tag: character.id as Object,
          child: Image.network(character.image,fit: BoxFit.cover,),
        ),
      ),);
}

 Widget characterInfo(String title,String ?value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text:TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(color: MyColor.Mywhite,fontWeight: FontWeight.bold,fontSize: 18),
            ),
            TextSpan(
              text: value,
              style: TextStyle(color: MyColor.Mywhite,fontSize: 16),
            ),
          ]
        ) );
 }

 Widget buildDivider(double endIndent) {
return Divider(
  height: 30,
  endIndent:endIndent,
  color: MyColor.myYellow,
  thickness: 2,
);
 }
}