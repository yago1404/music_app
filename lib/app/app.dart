import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/app/blocs/home_bloc/bloc.dart';
import 'package:music_app/app/ultils/blocs_list.dart';
import 'package:music_app/app/ultils/repositories_list.dart';

import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: getRepositories(context),
      child: MultiBlocProvider(
        providers: getBlocsList(context),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          darkTheme: _theme(),
          themeMode: ThemeMode.dark,
          home: const HomePage(),
        ),
      ),
    );
  }

  ThemeData _theme() {
    return ThemeData(
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
