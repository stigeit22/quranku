import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:quran_stige/shared/utils/colors.dart';
import 'package:quran_stige/sreens/home/homescreen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late int _selectedIdex = 0;
  late final screen = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
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
        backgroundColor: white,
        buttonBackgroundColor: purple,
        onTap: _selectedScreen,
        color: dark_purple,
        items: <Widget>[
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
