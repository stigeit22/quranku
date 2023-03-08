import 'package:flutter/material.dart';
import 'package:quran_stige/model/surah_model.dart';
import 'package:quran_stige/shared/utils/colors.dart';

import '../../model/ayat_model.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetItemAyat extends StatefulWidget {
  final Ayat ayat;
  final SurahModel surahModel;
  const WidgetItemAyat(
      {super.key, required this.ayat, required this.surahModel});

  @override
  State<WidgetItemAyat> createState() => _WidgetItemAyatState();
}

class _WidgetItemAyatState extends State<WidgetItemAyat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                Container(
                  height: 27.0,
                  width: 27.0,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(13.0)),
                  child: Center(
                    child: Text(
                      widget.ayat.nomor.toString(),
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        size: 24.0,
                        color: white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark,
                        size: 24.0,
                        color: white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.ayat.ar.toString(),
              textAlign: TextAlign.right,
              style: GoogleFonts.amiri(
                  color: white, fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.ayat.idn,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 16.0, color: white),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
