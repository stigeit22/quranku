import 'package:flutter/material.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:share_plus/share_plus.dart';

import '../../model/doa_puasa_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDoaPuasa extends StatelessWidget {
  final Puasa puasa;
  const ItemDoaPuasa({super.key, required this.puasa});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 47.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              decoration: BoxDecoration(
                color: grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    puasa.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Share.share(
                        puasa.title +
                            "\n" +
                            puasa.arabic +
                            "\n" +
                            puasa.translation +
                            ' \n "Quranku by Stiget IT"',
                        subject: 'Ayat',
                      );
                    },
                    child: const Icon(
                      Icons.share,
                      size: 24.0,
                      color: yellow,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                textAlign: TextAlign.right,
                puasa.arabic,
                style: GoogleFonts.amiri(
                  fontSize: 24.0,
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    puasa.latin,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    puasa.translation,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
