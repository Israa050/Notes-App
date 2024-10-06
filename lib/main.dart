import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/core/routes/app_router.dart';
import 'package:notes/core/utils/app_colors.dart';
import 'package:notes/core/utils/app_consonants.dart';
import 'package:notes/features/home/data/model/note.dart';
import 'package:notes/features/home/presentation/screens/add_edit_note_view.dart';
import 'package:notes/features/home/presentation/widgets/custom_colors_row.dart';
import 'package:notes/features/home/presentation/widgets/notes_view.dart';
import 'package:notes/features/search/presentation/screens/search_view.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  // Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(notesBox);
  runApp(MyApp());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchView(),
    );
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  AppRouter appRouter = AppRouter();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

