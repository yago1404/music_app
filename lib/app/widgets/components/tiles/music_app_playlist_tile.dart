import 'package:flutter/material.dart';
import 'package:music_app/api/models/playlist.dart';

class MusicAppPlaylistTile extends StatefulWidget {
  final Playlist playlist;
  const MusicAppPlaylistTile({Key? key, required this.playlist}) : super(key: key);

  @override
  State<MusicAppPlaylistTile> createState() => _MusicAppPlaylistTileState();
}

class _MusicAppPlaylistTileState extends State<MusicAppPlaylistTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onLongPress: _showBottomSheet,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        child: SizedBox(
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage(widget.playlist.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 12),
              Text(widget.playlist.name),
              const Spacer(),
              GestureDetector(
                onTap: _showBottomSheet,
                child: const Icon(Icons.more_vert, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (_) =>
          BottomSheet(
            enableDrag: false,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(.8),
            onClosing: () {},
            builder: (_) =>
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        Text('test'),
                      ],
                    ),
                  ),
                ),
          ),
    );
  }
}
