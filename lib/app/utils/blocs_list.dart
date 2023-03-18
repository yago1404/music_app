import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/repositories/home_repository.dart';
import 'package:music_app/app/blocs/home_bloc/bloc.dart';
import 'package:music_app/app/blocs/search_bloc/bloc.dart';

final List<BlocProvider> blocList = [
  BlocProvider(
    create: (context) => HomeBloc(homeRepository: context.read<HomeRepository>()),
  ),
  BlocProvider(
    create: (context) => SearchBloc(),
  ),
];