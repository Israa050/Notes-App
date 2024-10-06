

part of 'notes_cubit.dart';

@immutable
abstract class NotesState extends Equatable {}

class NotesInitial extends NotesState {


  @override
  List<Object?> get props => [];
}

class EmptyNotes extends NotesState{

  @override
  List<Object?> get props => [];
}

class Loading extends NotesState{

  @override
  List<Object?> get props => [];
}

class OldNotes extends NotesState {
  final List<Note> oldNotes;

  OldNotes({required this.oldNotes});

  OldNotes copyWith({List<Note>? oldNotes}) {
    return OldNotes(
      oldNotes: oldNotes ?? this.oldNotes, // Use the provided list or the existing one
    );
  }
  
  @override
  List<Object?> get props => [oldNotes];
  
}


class EmptyNoteError extends NotesState{
  final String message;

  EmptyNoteError({required this.message});
  
  @override
  List<Object?> get props => [message];
  
}

class DeleteNoteSuccess extends NotesState{
  @override
  List<Object?> get props => [];
}

class ChangeBackgroundColor extends NotesState{
  final Color color;

  ChangeBackgroundColor({required this.color});

  @override
  List<Object?> get props => [];
}