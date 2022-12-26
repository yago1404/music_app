import 'music.dart';

class Playlist {
  String name;
  String image;
  List<Music>? musics;

  Playlist({required this.image, required this.name, this.musics});
}