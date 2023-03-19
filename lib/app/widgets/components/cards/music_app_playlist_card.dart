import 'package:flutter/material.dart';

class MusicAppPlaylistCard extends StatelessWidget {
  final String name;
  final String? image;

  const MusicAppPlaylistCard({Key? key, required this.name, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 160,
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
    );
  }
}
