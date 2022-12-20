import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: _theme(),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }

  ThemeData _theme() {
    return ThemeData(
      primaryColor: const MaterialColor(
        0xFF070A0A,
        <int, Color>{},
      ),
      scaffoldBackgroundColor: const Color(0xFF070A0A),
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
