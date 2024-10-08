

import 'package:dartz/dartz.dart';
import '../../../../core/database/db_helper.dart';
import '../../../../core/routes/app_router.dart';
import '../model/error_model.dart';
import '../model/note.dart';

class NotesRepository {

  final DbHelper dbHelper;

  NotesRepository({required this.dbHelper});

  void createNote(Note note){
    dbHelper.createNote(note);
  }

  Either<ErrorModel, List<Note>> getAllNotes(){
    
   // try{
      final notes = dbHelper.getNotes();
      if(notes == null){
        return Left(ErrorModel(message: 'Wrong Error Happened'));
      }
      return Right(notes);
    // }catch(e){
       //return Left( ErrorModel(message: 'Cannot get'));
     //}
  }

  void deleteNote(int index){
     dbHelper.deleteNote(index);
  }

  void updateNote(int index,Note note){
     dbHelper.updateNote(index, note);
  }

}