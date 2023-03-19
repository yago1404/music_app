import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/app/blocs/home_bloc/bloc.dart';
import 'package:music_app/app/pages/home_page.dart';
import 'package:music_app/app/pages/search_page.dart';
import 'package:music_app/app/widgets/components/music_app_bottom_navigation_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentPage = 0;
  late final List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const SearchPage(),
    const SearchPage(),
  ];

  @override
  void initState() {
    context.read<HomeBloc>().add(FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: MusicAppBottomNavigationBar(
        onChangePage: _onChangePage,
      ),
    );
  }

  _onChangePage({required int page}) {
    setState(() {
      currentPage = page;
    });
  }
}
