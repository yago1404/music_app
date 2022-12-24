import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/repositories/home_repository.dart';

final repositoriesList = [
  RepositoryProvider(
    create: (context) => HomeRepository(context: context),
  ),
];
