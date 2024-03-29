import 'package:flutter/cupertino.dart';
import 'package:music_app/api/main_service.dart';
import 'package:music_app/api/models/artist.dart';
import 'package:music_app/api/models/music.dart';
import 'package:music_app/api/models/playlist.dart';

class CoreRepository {
  MainService mainService;
  List<Artist> favoriteArtist = [];
  List<Music> recentPlayed = [];
  List<Playlist> forYou = [];

  CoreRepository({required BuildContext context}) : mainService = MainService(context);

  fetchFavoriteArtist() async {
    await Future.delayed(const Duration(seconds: 2));
    favoriteArtist.add(Artist(name: 'Hariel', photo: 'assets/images/mc-hariel.jpeg'));
    favoriteArtist.add(Artist(name: 'Djonga', photo: 'assets/images/djonga.jpeg'));
    favoriteArtist.add(Artist(name: 'Kevin', photo: 'assets/images/kevin.png'));
    favoriteArtist.add(Artist(name: 'Rian SP', photo: 'assets/images/rian-sp.webp'));
    favoriteArtist.add(Artist(name: 'Kant', photo: 'assets/images/kant.jpeg'));
  }

  fetchRecentPlayed() async {
    await Future.delayed(const Duration(seconds: 2));
    recentPlayed.add(
      Music(
        name: 'Rolê no Tempo',
        image: 'assets/images/role-no-tempo.jpg',
        author: Artist(
          name: 'Kevin',
          photo: 'assets/images/kevin.png',
        ),
      ),
    );
    recentPlayed.add(
      Music(
        name: 'GTA SP',
        image: 'assets/images/gta-sp.jpeg',
        author: Artist(
          name: 'Rian SP',
          photo: 'assets/images/rian-sp.webp',
        ),
      ),
    );
    recentPlayed.add(
      Music(
        name: 'Ano de Copa',
        image: 'assets/images/ano-de-copa.jpg',
        author: Artist(
          name: 'Mc Hariel',
          photo: 'assets/images/mc-hariel.jpeg',
        ),
      ),
    );
  }

  fetchForYou() async {
    await Future.delayed(const Duration(seconds: 2));
    forYou.add(
      Playlist(
        image: 'assets/images/rap.jpeg',
        name: 'Rap Nacional',
        musics: [
          Music(
            name: 'Rolê no Tempo',
            image: 'assets/images/role-no-tempo.jpg',
            author: Artist(
              name: 'Kevin',
              photo: 'assets/images/kevin.png',
            ),
          ),
        ],
      ),
    );
    forYou.add(
      Playlist(
        image: 'assets/images/funk.jpeg',
        name: 'Funk',
        musics: [
          Music(
            name: 'Rolê no Tempo',
            image: 'assets/images/role-no-tempo.jpg',
            author: Artist(
              name: 'Kevin',
              photo: 'assets/images/kevin.png',
            ),
          ),
        ],
      ),
    );
    forYou.add(
      Playlist(
        image: 'assets/images/trap.webp',
        name: 'Trap Funk',
        musics: [
          Music(
            name: 'Rolê no Tempo',
            image: 'assets/images/role-no-tempo.jpg',
            author: Artist(
              name: 'Kevin',
              photo: 'assets/images/kevin.png',
            ),
          ),
        ],
      ),
    );
  }
}
