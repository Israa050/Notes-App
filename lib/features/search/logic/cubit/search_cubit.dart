import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/features/home/data/model/note.dart';
import 'package:notes/features/home/data/repository/notes_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final NotesRepository repository;
  SearchCubit({required this.repository}) : super(SearchInitial()){
     emit(EmptySearch());
  }

  List<Note>? searchedList;
  List<Note>? filteredList;

  void _getAllNotes() {
    repository.getAllNotes().fold(
          (error) {
           // emit(SearchFailure(message: error.message));
          },
          (notes) {
            searchedList = notes;
            // emit(SearchSuccess(items: notes));
          },
    );
  }

  void filterList(String keyword){
    if(keyword.isEmpty){
    emit(EmptySearch());
    return;
    }
    _getAllNotes();
    if(searchedList == null || searchedList!.isEmpty){
      emit(SearchFailure(message: 'No Data'));
      return;
    }else{
      filteredList = searchedList?.where((note)=> note.title!.toLowerCase().contains(keyword.toLowerCase()) || note.description!.toLowerCase()
      .contains(keyword.toLowerCase())).toList();
      print(filteredList);
      if(filteredList!.isNotEmpty){
        emit(SearchSuccess(items: filteredList!));
        //filteredList = null;
        return;
      }else{
        emit(SearchFailure(message: 'message'));
      }
    }
  }
}
