import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/models/artist.dart';
import 'package:music_app/api/repositories/home_repository.dart';

part 'state.dart';
part 'event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}): super(Loading()) {
    on<FetchData>(_fetchData);
  }

  Future _fetchData(FetchData event, Emitter<HomeState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    homeRepository.favoriteArtist.add(Artist(name: 'Hariel', photo: 'assets/images/mc-hariel.jpeg'));
    homeRepository.favoriteArtist.add(Artist(name: 'Djonga', photo: 'assets/images/djonga.jpeg'));
    homeRepository.favoriteArtist.add(Artist(name: 'Kevin', photo: 'assets/images/kevin.png'));
    homeRepository.favoriteArtist.add(Artist(name: 'Rian SP', photo: 'assets/images/rian-sp.webp'));
    homeRepository.favoriteArtist.add(Artist(name: 'Kant', photo: 'assets/images/kant.jpeg'));
    emit(Loaded());
  }
}