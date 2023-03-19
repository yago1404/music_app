import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/models/artist.dart';
import 'package:music_app/api/models/music.dart';
import 'package:music_app/api/models/playlist.dart';
import 'package:music_app/api/repositories/home_repository.dart';
import 'package:music_app/app/blocs/search_bloc/bloc.dart';
import 'package:music_app/app/widgets/components/cards/music_app_playlist_card.dart';
import 'package:music_app/app/widgets/components/music_app_music_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentFilter = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return SafeArea(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
                color: Theme.of(context).primaryColor,
                child: TextField(
                  controller: _searchController,
                  style: Theme.of(context).textTheme.bodyText1,
                  onChanged: (value) => _checkClear(),
                  decoration: InputDecoration(
                    hintText: 'Procure pela musica que quer ouvir',
                    prefixIcon: GestureDetector(
                      onTap: _search,
                      child: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  onEditingComplete: _search,
                  textInputAction: TextInputAction.search,
                ),
              ),
              SizedBox(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 24),
                        _filterSelector(name: 'Músicas', index: 0),
                        _filterSelector(name: 'Artistas', index: 1),
                        _filterSelector(name: 'Playlists', index: 2),
                        _filterSelector(name: 'Podcasts', index: 3),
                        _filterSelector(name: 'Video clips', index: 4),
                        _filterSelector(name: 'Contas', index: 5),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is EmptySearch) {
                return Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: [
                      for (Playlist playlist in context.read<HomeRepository>().forYou) ...[
                        MusicAppPlaylistCard(name: playlist.name, image: playlist.image)
                      ],
                    ],
                  ),
                );
              } else if (state is Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Expanded(
                child: ListView(
                  children: [
                    for (Music music in context.read<HomeRepository>().recentPlayed) ...[
                      MusicAppMusicTile(
                        music: music,
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  _filterSelector({required String name, required int index}) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: () => setState(() {
            _currentFilter = index;
          }),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          decoration: BoxDecoration(
            color: _currentFilter == index ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            name,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: _currentFilter == index ? Colors.white : Colors.green,),
          ),
        ),
      ),
    );
  }

  _checkClear() {
    if (_searchController.text == '') {
      context.read<SearchBloc>().add(ClearSearch());
    }
  }

  _search() {
    _checkClear();
    context.read<SearchBloc>().add(Tap(value: _searchController.text));
  }
}
