import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_stige/model/surah_model.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:quran_stige/screens/details_surah/details_surah.dart';

import '../../../shared/widgets/item_surah.dart';

class SurahTab extends StatefulWidget {
  const SurahTab({super.key});

  @override
  State<SurahTab> createState() => _SurahTabState();
}

class _SurahTabState extends State<SurahTab> {
  Future<List<SurahModel>> _getSurah() async {
    String data = await rootBundle.loadString('assets/datas/list_surah.json');
    return surahModelFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SurahModel>>(
      future: _getSurah(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return ListView.separated(
            itemBuilder: (context, index) {
              return ItemSurah(
                surahModel: snapshot.data!.elementAt(index),
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Divider(
                  color: grey.withOpacity(0.3),
                ),
              );
            },
            itemCount: snapshot.data!.length);
      },
    );
  }
}
