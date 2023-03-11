import 'package:flutter/material.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:quran_stige/shared/utils/next_screen.dart';
import 'package:quran_stige/screens/prayer/widget/bacaan_sholat.dart';
import 'package:quran_stige/screens/prayer/widget/doa_harian.dart';
import 'package:quran_stige/screens/prayer/widget/doa_puasa.dart';
import 'package:quran_stige/screens/prayer/widget/niat_sholat.dart';

import '../../shared/widgets/custom_list_tile.dart';

class PrayerScreen extends StatelessWidget {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: grey,
            size: 24.0,
          ),
        ),
        title: const Text(
          'Kumpulan Doa',
          style: TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: white,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/prayer.png'),
            ),
            CustomListTile(
              images: 'assets/images/hand.png',
              text: "Niat Sholat Fardhu",
              onTap: () {
                nextScreen(
                  context,
                  const NiatSholatScreen(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/hand.png',
              text: "Bacaan Sholat",
              onTap: () {
                nextScreen(
                  context,
                  const BacaanSholatScreen(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/hand.png',
              text: "Do'a Puasa",
              onTap: () {
                nextScreen(
                  context,
                  DoaPuasaSreenDetails(),
                );
              },
            ),
            CustomListTile(
              images: 'assets/images/hand.png',
              text: "Do'a Harian",
              onTap: () {
                nextScreen(
                  context,
                  DoaharianScreenDetails(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
