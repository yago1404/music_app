import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/repositories/core_repository.dart';

part 'state.dart';
part 'event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CoreRepository homeRepository;

  HomeBloc({required this.homeRepository}): super(Loading()) {
    on<FetchData>(_fetchData);
  }

  Future _fetchData(FetchData event, Emitter<HomeState> emit) async {
    await homeRepository.fetchFavoriteArtist();
    await homeRepository.fetchRecentPlayed();
    await homeRepository.fetchForYou();
    emit(Loaded());
  }
}