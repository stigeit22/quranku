import 'package:flutter/material.dart';
import 'package:quran_stige/screens/hadist/widget/hadist_abu_daud.dart';
import 'package:quran_stige/screens/hadist/widget/hadist_ahmad.dart';
import 'package:quran_stige/screens/hadist/widget/hadist_bukhari.dart';
import 'package:quran_stige/screens/hadist/widget/hadist_darimi.dart';
import 'package:quran_stige/screens/hadist/widget/hadist_ibu_majah.dart';
import 'package:quran_stige/screens/hadist/widget/hadist_muslim.dart';
import 'package:quran_stige/screens/hadist/widget/hadist_tirmidzi.dart';
import 'package:quran_stige/shared/utils/next_screen.dart';
import 'package:quran_stige/shared/widgets/custom_list_tile.dart';

import '../../shared/utils/colors.dart';

class HadistScreen extends StatelessWidget {
  const HadistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: Image.asset(
          'assets/images/lamp.png',
          color: yellow,
          width: 10.0,
          height: 20.0,
        ),
        title: const Text(
          "Kumpulan Hadist",
          style: TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/hadist.png',
                fit: BoxFit.cover,
              ),
            ),
            CustomListTile(
              images: 'assets/images/lamp.png',
              text: 'Abu Daud',
              onTap: () {
                nextScreen(
                  context,
                  const HadistAbuDaudScreen(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/lamp.png',
              text: 'Ahmad',
              onTap: () {
                nextScreen(
                  context,
                  const HadistAhmadScreen(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/lamp.png',
              text: 'Bukhari',
              onTap: () {
                nextScreen(
                  context,
                  const HadistBukhari(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/lamp.png',
              text: 'Darimi',
              onTap: () {
                nextScreen(
                  context,
                  const HadistDarimiScreen(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/lamp.png',
              text: 'Ibnu Majah',
              onTap: () {
                nextScreen(
                  context,
                  const HadistIbnuMajahScreen(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/lamp.png',
              text: 'Muslim',
              onTap: () {
                nextScreen(
                  context,
                  const HadistMuslimScreen(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/lamp.png',
              text: 'Tirmidzi',
              onTap: () {
                nextScreen(context, const HadistTirmidziScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
