import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/models/artist.dart';
import 'package:music_app/api/models/music.dart';
import 'package:music_app/app/blocs/search_bloc/bloc.dart';
import 'package:music_app/app/widgets/components/music_app_music_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentFilter = 0;

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
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                color: Theme.of(context).primaryColor,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: const InputDecoration(
                    hintText: 'Procure pela musica que quer ouvir',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
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
          BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            if (state is EmptySearch) {
              return Expanded(
                child: GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: const Text("He'd have you all unravel at the"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[200],
                      child: const Text('Heed not the rabble'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[300],
                      child: const Text('Sound of screams but the'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[400],
                      child: const Text('Who scream'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[500],
                      child: const Text('Revolution is coming...'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[600],
                      child: const Text('Revolution, they...'),
                    ),
                  ],
                ),
              );
            }
            return Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  MusicAppMusicTile(
                    music: Music(
                      name: 'Ano de copa',
                      image: 'assets/images/ano-de-copa.jpg',
                      author: Artist(
                          name: 'Mc Hariel',
                          photo: 'assets/images/mc-hariel.jpeg'),
                    ),
                  ),
                  MusicAppMusicTile(
                    music: Music(
                      name: 'GTA SP',
                      image: 'assets/images/gta-sp.jpeg',
                      author: Artist(
                          name: 'Major', photo: 'assets/images/mc-hariel.jpeg'),
                    ),
                  ),
                  MusicAppMusicTile(
                    music: Music(
                      name: 'Rolê no tempo',
                      image: 'assets/images/role-no-tempo.jpg',
                      author: Artist(
                          name: 'Kevin', photo: 'assets/images/kevin.png'),
                    ),
                  ),
                ],
              ),
            );
          }),
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
}
