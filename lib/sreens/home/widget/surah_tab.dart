import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_stige/model/surah_model.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:quran_stige/sreens/details_surah/details_surah.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});
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
              return _surahItem(
                surahModel: snapshot.data!.elementAt(index),
                context: context,
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

  Widget _surahItem(
          {required SurahModel surahModel, required BuildContext context}) =>
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailsSurah(
                noSurah: surahModel.nomor,
                namelatin: surahModel.namaLatin,
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/number.png'),
                  ),
                ),
                child: Center(
                  child: Text(
                    "${surahModel.nomor}",
                    style: TextStyle(
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
                      style: TextStyle(
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
                          style: TextStyle(fontSize: 12.0, color: grey),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          height: 5.0,
                          width: 5.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: purple),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "${surahModel.jumlahAyat} Ayat",
                          style: TextStyle(fontSize: 12.0, color: grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                surahModel.nama,
                style: TextStyle(
                  fontSize: 20.0,
                  color: purple_text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
}
