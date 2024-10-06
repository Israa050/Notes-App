import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_functions.dart';
import '../../data/model/note.dart';
import '../../data/repository/notes_repository.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final NotesRepository repository;
  NotesCubit( 
    this.repository,
  ) : super(NotesInitial());

  String? title;
  String? description;
  Color color = AppColors.lightPurple;
  int index = 0;
  GlobalKey<FormState> notesFormKey = GlobalKey();
  bool isLoading = false;
  List<Note> list = [];


  Future<void> emitCreateNewNote() async{
     emit(Loading());
      Note note = Note(
        title: title,
        description: description,
        dateTime: AppFunctions.currentDate,
        color: color.value
      );
      repository.createNote(note);
      list.add(note);
      emit(OldNotes(oldNotes: [note]));
  }

  void getAllNotes(){
    print('getAllNotes called');
    emit(Loading());
    repository.getAllNotes().fold(
      (error)=> emit(EmptyNotes(),), 
      (notes){
        list.addAll(notes);
        emit(OldNotes(oldNotes: notes));  
  });
    print('getAllNotes finished');
  }

  void emitDeleteNote({required int index}){
    repository.deleteNote(index);
    getAllNotes();
  }

  void emitUpdateNote(int index)async{
     emit(Loading());
      Note note = Note(
        title: title,
        description: description,
        dateTime: AppFunctions.currentDate,
        color: color.value,
      );
    repository.updateNote(index, note);
    emit(OldNotes(oldNotes: [note]));
  }

  int getColorIndex(Color currentColor){
    return AppColors.colors.indexOf(currentColor);
  }

  void changeBackgroundColor(Color newColor){
    emit(Loading());
    print('changeBackgroundColor called');
    color = newColor;
    emit(ChangeBackgroundColor(color: newColor));
    print('changeBackgroundColor called');
  }


}