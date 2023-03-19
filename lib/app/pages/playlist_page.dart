import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/models/music.dart';
import 'package:music_app/api/models/playlist.dart';
import 'package:music_app/api/repositories/core_repository.dart';
import 'package:music_app/app/widgets/components/tiles/music_app_music_tile.dart';
import 'package:music_app/app/widgets/components/tiles/music_app_playlist_tile.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Playlists',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 22,
                  ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (Playlist playlist in context.read<CoreRepository>().forYou) ...[
                  MusicAppPlaylistTile(
                    playlist: playlist,
                  ),
                ],
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                         Text('Adicionar Playlist'),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
