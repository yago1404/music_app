import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/repositories/home_repository.dart';
import 'package:music_app/app/blocs/home_bloc/bloc.dart';
import 'package:music_app/app/pages/search_page.dart';
import 'package:music_app/app/widgets/components/music_app_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  late final List<Widget> pages = [
    _home(),
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
      bottomNavigationBar: MusicAppBottomNavigationBar(onChangePage: _onChangePage,),
    );
  }

  Widget _home() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Olá Yago!',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        'Vamos ouvir algo legal hoje',
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF474855),
                    ),
                    child: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            _sectionLabel(sectionName: 'Seus artistas favoritos'),
            const SizedBox(height: 12),
            SizedBox(
              height: 120,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 50, height: 50, child: CircularProgressIndicator()),
                      ],
                    );
                  }
                  return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: context.read<HomeRepository>().favoriteArtist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 24 : 0),
                      child: _artistCircle(
                        name: context.read<HomeRepository>().favoriteArtist[index].name,
                        image: context.read<HomeRepository>().favoriteArtist[index].photo,
                      ),
                    );
                  },
                );
              }
              ),
            ),
            const SizedBox(height: 24),
            _sectionLabel(sectionName: 'Tocadas recentemente'),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 200,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(width: 50, height: 50, child: CircularProgressIndicator()),
                    ],
                  );
                  }
                  return ListView.builder(
                    itemCount: context.read<HomeRepository>().recentPlayed.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 24.0 : 0),
                      child: _musicCard(
                        name: context.read<HomeRepository>().recentPlayed[index].name,
                        image: context.read<HomeRepository>().recentPlayed[index].image,
                      ),
                    );
                    },
                  );
                }
              ),
            ),
            const SizedBox(height: 24),
            _sectionLabel(sectionName: 'Feito pra você'),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  _playlistCard(
                    name: 'Rap Nacional',
                    image: 'assets/images/rap.jpeg',
                  ),
                  _playlistCard(
                    name: 'Funk',
                    image: 'assets/images/funk.jpeg',
                  ),
                  _playlistCard(
                    name: 'Trap Funk',
                    image: 'assets/images/trap.webp',
                  ),
                  _playlistCard(
                    name: 'Daily',
                    image: 'assets/images/set-dos-casados.jpeg',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  _sectionLabel({required String sectionName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(sectionName),
          const Icon(
            Icons.navigate_next,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  _artistCircle({String? name, String? image}) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage(image ?? 'assets/images/user.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            name ?? 'Sem nome',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  _musicCard({required String name, String? image}) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(image ?? 'assets/images/user.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  _playlistCard({required String name, String? image}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: SizedBox(
        width: 160,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(image ?? 'assets/images/user.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(color: Colors.black, blurRadius: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onChangePage({required int page}) {
    setState(() {
      currentPage = page;
    });
  }
}
