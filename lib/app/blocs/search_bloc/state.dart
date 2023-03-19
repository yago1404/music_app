part of 'bloc.dart';

class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmptySearch extends SearchState {}

class Loading extends SearchState {}

class Loaded extends SearchState {
  final String searchLabel;

  Loaded(this.searchLabel);
}

class Taping extends SearchState {}
