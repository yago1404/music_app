import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/repositories/core_repository.dart';

final repositoriesList = [
  RepositoryProvider(
    create: (context) => CoreRepository(context: context),
  ),
];
