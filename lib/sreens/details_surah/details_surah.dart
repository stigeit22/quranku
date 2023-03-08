import 'dart:convert';

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
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 24.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 285,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: const LinearGradient(
                              stops: [0, 3],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [yellow, black]),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Opacity(
                          opacity: .2,
                          child: Image.asset(
                            'assets/images/quran_home.png',
                            width: 324.0 - 55,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 28.0, horizontal: 19.0),
                        child: Column(
                          children: [
                            Text(
                              surahModel.namaLatin,
                              style: const TextStyle(
                                fontSize: 26.0,
                                color: white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              surahModel.arti,
                              style: const TextStyle(
                                  fontSize: 16.0,
                                  color: white,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Divider(
                              color: white.withOpacity(.35),
                              height: 2,
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  surahModel.tempatTurun.name,
                                  style: const TextStyle(
                                      fontSize: 14.0,
                                      color: white,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Container(
                                  height: 5.0,
                                  width: 5.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: yellow,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "${surahModel.jumlahAyat} Ayat",
                                  style: const TextStyle(
                                      fontSize: 14.0,
                                      color: white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Image.asset(
                              'assets/images/bissmillah.png',
                              height: 48.0,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 10.0,
                        right: 10.0,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 10.0,
                                child: Slider(
                                  min: 0,
                                  max: duration.inSeconds.toDouble(),
                                  value: position.inSeconds.toDouble(),
                                  onChanged: (value) async {
                                    final postion =
                                        Duration(seconds: value.toInt());
                                    await audioPlayers.seek(position);
                                    await audioPlayers.resume();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: SizedBox(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(formatTime(position),
                                          style: TextStyle(color: white)),
                                      Text(
                                        formatTime(duration - position),
                                        style: TextStyle(color: white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  if (isPlaying) {
                                    await audioPlayers.pause();
                                  } else {
                                    await audioPlayers.play(
                                        DeviceFileSource(surahModel.audio));
                                  }
                                },
                                icon: Icon(
                                  isPlaying ? Icons.pause : Icons.play_arrow,
                                  size: 24.0,
                                  color: white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
            body: ListView.separated(
                itemBuilder: (context, index) {
                  final ayat = surahModel.ayat![index];
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
