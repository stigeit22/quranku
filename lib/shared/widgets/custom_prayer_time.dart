import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomPrayerTimes extends StatelessWidget {
  final String iconWaktu;
  final String nameTimes;
  final String time;
  final String iconSholat;

  const CustomPrayerTimes(
      {super.key,
      required this.nameTimes,
      required this.time,
      required this.iconSholat,
      required this.iconWaktu});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: white, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 36.0,
                width: 36.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/number.png'),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    iconWaktu,
                    height: 17.0,
                    width: 20.0,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                nameTimes,
                style: const TextStyle(fontSize: 16.0, color: white),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Image.asset(
                iconSholat,
                width: 32.0,
                height: 32.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
