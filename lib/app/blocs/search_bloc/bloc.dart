import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';
part 'event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(EmptySearch()) {
    on<Tap>(_tap);
    on<ClearSearch>(_clearSearch);
  }

  _tap(Tap event, Emitter<SearchState> emit) async {
    emit(Loading());
    await Future.delayed(const Duration(seconds: 2));
    emit(Loaded(event.value!));
  }

   _clearSearch(ClearSearch event, Emitter<SearchState> emit) {
    emit(EmptySearch());
  }
}
