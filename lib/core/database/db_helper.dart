
import 'package:hive/hive.dart';
import '../utils/app_consonants.dart';
import '../../features/home/data/model/note.dart';

class DbHelper {
    
     Box<Note>? box;
     DbHelper(){
       openBox();
     }

     openBox (){
      box = Hive.box<Note>(notesBox);
     }

    void createNote(Note note)async{
      try{
        // final notes = Hive.box(notesBox);
         final notes = box;
        await notes?.add(note);
      }catch(e){
        //print(e.toString());
      }
    }


    List<Note>? getNotes(){
       final notes = Hive.box<Note>(notesBox);
       List<Note>? list = notes.values.toList();
       return list.isEmpty? null : list;
    }

    void deleteNote(int index){
      Hive.box<Note>(notesBox).deleteAt(index);
    }

    void updateNote(int index,Note note)async{
      await Hive.box<Note>(notesBox).putAt(index, note);
    }

}