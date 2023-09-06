import 'package:breaking_bad/constants/mycolor.dart';
import 'package:breaking_bad/constants/strings.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8,8,8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color:MyColor.Mywhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child:InkWell(
        onTap: ()=>Navigator.of(context).pushNamed(characterDetailScreen,arguments: character),
        child: GridTile(
          child: Hero(
            tag:character.id as Object,
            child: Container(
              color: MyColor.Mygrey,
              child: character.image.isNotEmpty?
              FadeInImage.assetNetwork(
                width: double.infinity,
                  height: double.infinity,
                  placeholder: 'assets/images/loading.gif',
                  image: character.image,fit: BoxFit.cover,):Center(child: CircularProgressIndicator()),
            ),
          ),
          footer: Container(
            width:double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text('${character.name}',style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: MyColor.Mywhite,
              fontWeight: FontWeight.bold,
            ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ) ,
    );
  }
}
