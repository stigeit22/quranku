import 'package:flutter/material.dart';
import 'package:quran_stige/model/surah_model.dart';
import 'package:quran_stige/shared/utils/colors.dart';

import '../../screens/details_surah/details_surah.dart';

class ItemSurah extends StatelessWidget {
  final SurahModel surahModel;
  const ItemSurah({super.key, required this.surahModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsSurah(
              noSurah: surahModel.nomor,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
        child: Row(
          children: [
            Container(
              height: 36.0,
              width: 36.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/number.png',
                    ),
                    invertColors: false),
              ),
              child: Center(
                child: Text(
                  "${surahModel.nomor}",
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surahModel.namaLatin,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: [
                      Text(
                        surahModel.tempatTurun.name,
                        style: const TextStyle(fontSize: 12.0, color: grey),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Container(
                        height: 5.0,
                        width: 5.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: yellow),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "${surahModel.jumlahAyat} Ayat",
                        style: const TextStyle(fontSize: 12.0, color: grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              surahModel.nama!,
              style: const TextStyle(
                fontSize: 20.0,
                color: yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
