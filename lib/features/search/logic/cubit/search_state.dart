part of 'search_cubit.dart';

sealed class SearchState extends Equatable {

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}


final class SearchSuccess extends SearchState{
  final List<Note> items;

  SearchSuccess({required this.items});
}

final class SearchFailure extends SearchState {
  final String message;

  SearchFailure({required this.message});
}

final class EmptySearch extends SearchState{
  
}
