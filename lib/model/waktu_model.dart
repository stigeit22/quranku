import 'package:flutter/material.dart';

class Times {
  late final int id;
  late final String images;
  late final String text;
  Times({
    required this.id,
    required this.images,
    required this.text,
  });
}

final List<Times> listTime = [
  Times(id: 1, images: 'assets/images/imsak.png', text: 'Imsak'),
  Times(id: 1, images: 'assets/images/subuh.png', text: 'Subuh'),
  Times(id: 1, images: 'assets/images/terbit.png', text: 'Terbit'),
  Times(id: 1, images: 'assets/images/zuhur.png', text: 'Zuhur'),
  Times(id: 1, images: 'assets/images/ashar.png', text: 'Ashar'),
  Times(id: 1, images: 'assets/images/maghrib.png', text: 'Maghrib'),
  Times(id: 1, images: 'assets/images/isya.png', text: 'Isya'),
];
