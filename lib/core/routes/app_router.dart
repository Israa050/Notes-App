import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/database/db_helper.dart';
import 'package:notes/core/routes/routes.dart';
import 'package:notes/core/utils/app_strings.dart';
import 'package:notes/features/home/data/model/note.dart';
import 'package:notes/features/home/data/repository/notes_repository.dart';
import 'package:notes/features/home/logic/cubit/notes_cubit.dart';
import 'package:notes/features/home/presentation/screens/add_edit_note_view.dart';
import 'package:notes/features/home/presentation/screens/home.dart';
import 'package:notes/features/search/logic/cubit/search_cubit.dart';
import 'package:notes/features/search/presentation/screens/search_view.dart';

NotesRepository repository = NotesRepository(dbHelper: DbHelper(),);

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.splashRoute:
      // return MaterialPageRoute(builder: (_)=> const SplashScreen());
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NotesCubit>(
            create: (context) => NotesCubit(repository),
            child: const Home(),
          ),
        );
      case AppRoutes.addEditNoteRoute:
        final Map<String, dynamic>? argument =
            settings.arguments as Map<String, dynamic>?;
        final Note? note = argument?['note'];
        final int? index = argument?['index'];
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => NotesCubit(repository),
            child: AddNewNoteView(
              note: note,
              index: index,
            ),
          ),
        );
      case AppRoutes.searchRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => NotesCubit(repository),
              child: BlocProvider(
                    create: (context) => SearchCubit(repository: repository),
                    child: const SearchView(),
                  ),
            ),
                );
    }

    return null;
  }
}
