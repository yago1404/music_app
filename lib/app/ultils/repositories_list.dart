import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/repositories/home_repository.dart';

List<RepositoryProvider> getRepositories(BuildContext context) {
  return [
    RepositoryProvider(
      create: (context) => HomeRepository(context: context),
    ),
  ];
}
