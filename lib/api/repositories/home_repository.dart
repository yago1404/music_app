import 'package:flutter/cupertino.dart';
import 'package:music_app/api/main_service.dart';
import 'package:music_app/api/models/artist.dart';

class HomeRepository {
  MainService mainService;
  List<Artist> favoriteArtist = [];

  HomeRepository({required BuildContext context}) : mainService = MainService(context);
}