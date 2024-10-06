

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes/core/utils/app_consonants.dart';
import 'package:notes/features/home/data/model/note.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


Future<void> setupHive()async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  // Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(notesBox);
}