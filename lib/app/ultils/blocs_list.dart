import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/repositories/home_repository.dart';
import 'package:music_app/app/blocs/home_bloc/bloc.dart';

List<BlocProvider> getBlocsList(BuildContext context) {
  return [
    BlocProvider(
      create: (context) => HomeBloc(homeRepository: context.read<HomeRepository>()),
    ),
  ];
}