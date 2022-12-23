import 'artist.dart';

class Music {
  String name;
  String image;
  Artist author;
  List<Artist>? artists;

  Music({required this.name, required this.image, required this.author, this.artists});
}