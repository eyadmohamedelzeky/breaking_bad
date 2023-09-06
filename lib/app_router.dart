import 'package:breaking_bad/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/constants/strings.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/data/repository/character_repository.dart';
import 'package:breaking_bad/data/web_services/character_web_service.dart';
import 'package:breaking_bad/presentation/screens/character_detail.dart';
import 'package:breaking_bad/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;
  AppRouter(){
    characterRepository=CharacterRepository(CharactersWebServices());
    charactersCubit=CharactersCubit(characterRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (BuildContext context)=>charactersCubit,
          child: CharactersScreen(),
          ),
        );
      case characterDetailScreen:
        final character=settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailScreen(character: character,),
        );
    }
  }
}
