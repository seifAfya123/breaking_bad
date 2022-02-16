import 'package:break_and_bad_v1/Data/Api/character_web_service.dart';
import 'package:break_and_bad_v1/Data/model/character_class.dart';
import 'package:break_and_bad_v1/Data/reposotiry/characters_repo.dart';
import 'package:break_and_bad_v1/Presentation/screens/character_screen.dart';
import 'package:break_and_bad_v1/Presentation/screens/detail_screen.dart';
import 'package:break_and_bad_v1/business%20logic/cubit/characters_cubit.dart';
import 'package:break_and_bad_v1/constants/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class appRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;
  appRouter() {
    charactersRepo = CharactersRepo(CharacterWebService());
    charactersCubit = CharactersCubit(charactersRepo);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case all_characters_Screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CharactersCubit(charactersRepo),
            child: const CharacterScreen(),
          ),
        );

      case character_detalis_screen:
        final character = settings.arguments as CharacterClass;
        return MaterialPageRoute(
            builder: (_) => DetailScreen(
                  character: character,
                ));
    }
  }
}
