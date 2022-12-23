import 'package:flutter/material.dart';
import 'package:music_app/api/models/music.dart';

class MusicAppMusicTile extends StatefulWidget {
  final Music music;
  const MusicAppMusicTile({Key? key, required this.music}) : super(key: key);

  @override
  State<MusicAppMusicTile> createState() => _MusicAppMusicTileState();
}

class _MusicAppMusicTileState extends State<MusicAppMusicTile> {
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
                    image: AssetImage(widget.music.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white.withOpacity(.8),
                    shadows: const [Shadow(color: Colors.black, blurRadius: 10)],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.music.name),
                  Text(
                    widget.music.author.name,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
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
