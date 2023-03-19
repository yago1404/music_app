part of 'bloc.dart';

class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Tap extends SearchEvent {
  final String? value;

  Tap({this.value});
}

class ClearSearch extends SearchEvent {}