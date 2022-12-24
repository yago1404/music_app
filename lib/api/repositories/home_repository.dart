import 'package:flutter/cupertino.dart';
import 'package:music_app/api/main_service.dart';
import 'package:music_app/api/models/artist.dart';

class HomeRepository {
  MainService mainService;
  List<Artist> favoriteArtist = [];

  HomeRepository({required BuildContext context}) : mainService = MainService(context);

  fetchFavoriteArtist() async {
    await Future.delayed(const Duration(seconds: 2));
    favoriteArtist.add(Artist(name: 'Hariel', photo: 'assets/images/mc-hariel.jpeg'));
    favoriteArtist.add(Artist(name: 'Djonga', photo: 'assets/images/djonga.jpeg'));
    favoriteArtist.add(Artist(name: 'Kevin', photo: 'assets/images/kevin.png'));
    favoriteArtist.add(Artist(name: 'Rian SP', photo: 'assets/images/rian-sp.webp'));
    favoriteArtist.add(Artist(name: 'Kant', photo: 'assets/images/kant.jpeg'));
  }
}