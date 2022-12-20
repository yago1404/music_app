import 'dart:io';

import 'package:flutter/material.dart';

class MusicAppBottomNavigationBar extends StatefulWidget {
  const MusicAppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MusicAppBottomNavigationBar> createState() =>
      _MusicAppBottomNavigationBarState();
}

class _MusicAppBottomNavigationBarState extends State<MusicAppBottomNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withOpacity(.1),
      padding: EdgeInsets.only(
        bottom: Platform.isIOS ? 24 : 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navigationItem(id: 0, icon: Icons.home_outlined),
          _navigationItem(id: 1, icon: Icons.search),
          _navigationItem(id: 2, icon: Icons.library_music_outlined),
          _navigationItem(id: 3, icon: Icons.person_outline),
        ],
      ),
    );
  }

  _navigationItem({required int id, required IconData icon}) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = id;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: currentIndex == id ? const Border(
            top: BorderSide(
              color: Colors.green,
              width: 6,
            ),
          ) : null,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        child: Icon(
          icon,
          color: currentIndex == id ? Colors.green : Colors.grey,
          shadows: id == currentIndex ? [
            const Shadow(color: Colors.green, blurRadius: 12)
          ] : null,
        ),
      ),
    );
  }
}
