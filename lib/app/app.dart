import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/repositories/home_repository.dart';

import 'blocs/home_bloc/bloc.dart';
import 'blocs/search_bloc/bloc.dart';
import 'pages/home_page.dart';
import 'utils/repositories_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositoriesList,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(homeRepository: context.read<HomeRepository>()),
          ),
          BlocProvider(
            create: (context) => SearchBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          darkTheme: _theme(context),
          themeMode: ThemeMode.dark,
          home: const HomePage(),
        ),
      ),
    );
  }

  ThemeData _theme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.green,
      primaryColor: const MaterialColor(
        0xFF070A0A,
        <int, Color>{},
      ),
      scaffoldBackgroundColor: const Color(0xFF070A0A),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 1),
        ),
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        bodyText2: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
