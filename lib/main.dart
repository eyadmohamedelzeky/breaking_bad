import 'package:breaking_bad/app_router.dart';
import 'package:breaking_bad/data/repository/character_repository.dart';
import 'package:breaking_bad/data/web_services/character_web_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BreakingBadApp(
    appRouter: AppRouter(),
  ),);
  CharacterRepository(CharactersWebServices()).getAllCharater();

}

class BreakingBadApp extends StatelessWidget {
  final AppRouter appRouter;
  const BreakingBadApp({required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
         useMaterial3: true,
      ),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
