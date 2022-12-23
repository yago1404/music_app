import 'package:flutter/cupertino.dart';
import 'package:music_app/api/main_service.dart';

class HomeRepository {
  MainService mainService;

  HomeRepository({required BuildContext context}) : mainService = MainService(context);
}