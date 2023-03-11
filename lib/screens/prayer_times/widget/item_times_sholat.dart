import 'package:flutter/material.dart';
import 'package:quran_stige/model/waktu_model.dart';

import '../../../shared/utils/colors.dart';

class ItemTimeSholat extends StatelessWidget {
  final Times times;
  const ItemTimeSholat({super.key, required this.times});

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
                    times.images,
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
                times.text,
                style: const TextStyle(fontSize: 16.0, color: white),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "text",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'assets/images/people.png',
                width: 24.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
