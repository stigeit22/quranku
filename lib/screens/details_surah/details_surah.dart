import 'dart:convert';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quran_stige/model/ayat_model.dart';
import 'package:quran_stige/model/surah_model.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_stige/shared/utils/format_time.dart';
import 'package:quran_stige/shared/widgets/widget_item_ayat.dart';
import 'package:intl/intl.dart';
import 'package:quran_stige/screens/details_surah/widget/header_details_surah.dart';

class DetailsSurah extends StatefulWidget {
  final int noSurah;

  const DetailsSurah({
    super.key,
    required this.noSurah,
  });

  @override
  State<DetailsSurah> createState() => _DetailsSurahState();
}

class _DetailsSurahState extends State<DetailsSurah> {
  //searchh ayat
  String searchQuery = '';

  final TextEditingController _searchController = TextEditingController();
  //audio
  final audioPlayers = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //atur play, pause, stop
    audioPlayers.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });
    //mengatur durasi
    audioPlayers.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    //posisi audio
    audioPlayers.onDurationChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayers.dispose();
  }

  Future<SurahModel?> _getDetailSurah() async {
    var data = await Dio().get("https://equran.id/api/surat/${widget.noSurah}");

    return SurahModel.fromJson(
      json.decode(
        data.toString(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SurahModel?>(
      future: _getDetailSurah(),
      initialData: null,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        SurahModel surahModel = snapshot.data!;

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 24.0,
                color: white,
              ),
            ),
            title: Text(
              surahModel.namaLatin,
              style: const TextStyle(color: white, fontWeight: FontWeight.bold),
            ),
            actions: [
              AnimSearchBar(
                width: MediaQuery.of(context).size.width,
                textController: _searchController,
                onSuffixTap: () {
                  setState(() {
                    _searchController.clear();
                  });
                },
                onSubmitted: (p0) {
                  searchQuery = p0;
                },
              )
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              HeaderDetailSurah(
                  surahModel: surahModel,
                  duration: duration,
                  position: position,
                  audioPlayers: audioPlayers,
                  isPlaying: isPlaying)
            ],
            body: ListView.separated(
                itemBuilder: (context, index) {
                  final ayat = surahModel.ayat![index];
                  if (searchQuery.isNotEmpty &&
                      ayat.nomor.toString().toLowerCase().contains(
                            searchQuery.toLowerCase(),
                          )) {
                    return Container();
                  }
                  return WidgetItemAyat(ayat: ayat, surahModel: surahModel);
                },
                separatorBuilder: (context, index) {
                  return Container();
                },
                itemCount: surahModel.jumlahAyat),
          ),
        );
      },
    );
  }
}
