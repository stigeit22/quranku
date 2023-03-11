import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran_stige/model/surah_model.dart';

import '../../../shared/utils/colors.dart';
import '../../../shared/utils/format_time.dart';

class HeaderDetailSurah extends StatelessWidget {
  const HeaderDetailSurah({
    super.key,
    required this.surahModel,
    required this.duration,
    required this.position,
    required this.audioPlayers,
    required this.isPlaying,
  });

  final SurahModel surahModel;
  final Duration duration;
  final Duration position;
  final AudioPlayer audioPlayers;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
              padding:
                  const EdgeInsets.symmetric(vertical: 28.0, horizontal: 19.0),
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
              child: SizedBox(
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
                          final postion = Duration(seconds: value.toInt());
                          await audioPlayers.seek(position);
                          await audioPlayers.resume();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formatTime(position),
                                style: const TextStyle(color: white)),
                            Text(
                              formatTime(duration - position),
                              style: const TextStyle(color: white),
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
                          await audioPlayers
                              .play(DeviceFileSource(surahModel.audio));
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
    );
  }
}
