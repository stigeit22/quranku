import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quran_stige/screens/hadist/hadist.dart';

import 'package:quran_stige/shared/utils/colors.dart';
import 'package:quran_stige/screens/bookmarks/bookmark.dart';
import 'package:quran_stige/screens/home/homescreen.dart';
import 'package:quran_stige/screens/prayer/prayer.dart';
import 'package:quran_stige/screens/prayer_times/prayer_times.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late int _selectedIdex = 0;
  late final screen = [
    const HomeScreen(),
    const HadistScreen(),
    const PrayerTimePage(),
    const PrayerScreen(),
    const BookMarkScreen(),
  ];

  void _selectedScreen(int index) {
    setState(() {
      _selectedIdex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_selectedIdex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: backgroundColor,
        buttonBackgroundColor: yellow.withOpacity(.9),
        onTap: _selectedScreen,
        color: Color(0XFF121931),
        items: const <Widget>[
          ImageIcon(
            AssetImage('assets/images/home.png'),
            color: white,
          ),
          ImageIcon(
            AssetImage('assets/images/lamp.png'),
            color: white,
          ),
          ImageIcon(
            AssetImage('assets/images/people.png'),
            color: white,
          ),
          ImageIcon(
            AssetImage('assets/images/hand.png'),
            color: white,
          ),
          ImageIcon(
            AssetImage('assets/images/book.png'),
            color: white,
          )
        ],
      ),
    );
  }
}
