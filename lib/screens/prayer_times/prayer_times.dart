import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../shared/utils/colors.dart';
import '../../shared/widgets/custom_prayer_time.dart';

class PrayerTimePage extends StatefulWidget {
  const PrayerTimePage({Key? key}) : super(key: key);

  @override
  _PrayerTimePageState createState() => _PrayerTimePageState();
}

class _PrayerTimePageState extends State<PrayerTimePage> {
  Position? _currentPosition;
  String? _prayerTimeError;
  Map<String, dynamic>? _prayerTimes;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = position;
    });

    await _getPrayerTimes(position.latitude, position.longitude);
  }

  Future<void> _getPrayerTimes(double latitude, double longitude) async {
    final response = await http.get(Uri.parse(
        'https://api.aladhan.com/v1/timings?latitude=$latitude&longitude=$longitude&method=2'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        _prayerTimes = data['data']['timings'];
      });
    } else {
      setState(() {
        _prayerTimeError = 'Failed to load prayer times';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: Image.asset('assets/images/people.png', color: yellow),
        title: const Text(
          'Waktu Sholat',
          style: TextStyle(color: white),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            bottom: PreferredSize(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/sholat.png',
                  fit: BoxFit.cover,
                ),
              ),
              preferredSize: Size.fromHeight(150),
            ),
          )
        ],
        body: Center(
          child: _currentPosition != null
              ? _prayerTimes != null
                  ? ListView(
                      children: [
                        CustomPrayerTimes(
                            nameTimes: 'Imsak',
                            time: _prayerTimes!['Imsak'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                        CustomPrayerTimes(
                            nameTimes: 'Subuh',
                            time: _prayerTimes!['Fajr'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                        CustomPrayerTimes(
                            nameTimes: 'Terbit',
                            time: _prayerTimes!['Sunrise'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                        CustomPrayerTimes(
                            nameTimes: 'Dzuhur',
                            time: _prayerTimes!['Dhuhr'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                        CustomPrayerTimes(
                            nameTimes: 'Ashar',
                            time: _prayerTimes!['Asr'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                        CustomPrayerTimes(
                            nameTimes: 'Maghrib',
                            time: _prayerTimes!['Maghrib'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                        CustomPrayerTimes(
                            nameTimes: 'Isya',
                            time: _prayerTimes!['Isha'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                      ],
                    )
                  : Text(
                      _prayerTimeError ?? 'Memuat waktu sholat...',
                      style: TextStyle(color: white),
                    )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
