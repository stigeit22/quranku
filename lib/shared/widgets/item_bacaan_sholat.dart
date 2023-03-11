import 'package:flutter/material.dart';
import 'package:quran_stige/model/bacaan_sholat_model.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemBacaanSholat extends StatelessWidget {
  final BacaanSholatModel bacaanSholatModel;
  const ItemBacaanSholat({super.key, required this.bacaanSholatModel});

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
                    bacaanSholatModel.name,
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
                        bacaanSholatModel.name +
                            "\n" +
                            bacaanSholatModel.arabic +
                            "\n" +
                            bacaanSholatModel.terjemahan +
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  textAlign: TextAlign.right,
                  bacaanSholatModel.arabic,
                  style: GoogleFonts.amiri(
                    fontSize: 24.0,
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    bacaanSholatModel.latin,
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
                    bacaanSholatModel.terjemahan,
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
