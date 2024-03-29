import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/repositories/core_repository.dart';
import 'package:music_app/app/blocs/home_bloc/bloc.dart';
import 'package:music_app/app/widgets/components/cards/music_app_playlist_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
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
                        SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                    );
                  }
                  return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: context.read<CoreRepository>().favoriteArtist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 24 : 0),
                      child: _artistCircle(
                        name: context.read<CoreRepository>().favoriteArtist[index].name,
                        image: context.read<CoreRepository>().favoriteArtist[index].photo,
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
                    itemCount: context.read<CoreRepository>().recentPlayed.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 24.0 : 0),
                      child: _musicCard(
                        name: context.read<CoreRepository>().recentPlayed[index].name,
                        image: context.read<CoreRepository>().recentPlayed[index].image,
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
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: context.read<CoreRepository>().forYou.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 24 : 0, right: 16),
                      child: MusicAppPlaylistCard(
                          name: context.read<CoreRepository>().forYou[index].name,
                          image: context.read<CoreRepository>().forYou[index].image,
                      ),
                    );
                  },
                  );
                }
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
}
