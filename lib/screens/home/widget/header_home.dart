import 'package:flutter/material.dart';

import '../../../shared/utils/colors.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Asslamualaikum",
            style: TextStyle(
              fontSize: 18.0,
              color: grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Stige IT",
            style: TextStyle(
              fontSize: 24.0,
              color: white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Stack(
            children: [
              Container(
                height: 131,
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
                child: Image.asset(
                  'assets/images/quran_home.png',
                  width: 180.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 19.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/books.png',
                          width: 20.0,
                          height: 20.0,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          "Last Read",
                          style: TextStyle(fontSize: 14.0, color: white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    const Text(
                      "Al-Fatiah",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Ayah No: 1",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
