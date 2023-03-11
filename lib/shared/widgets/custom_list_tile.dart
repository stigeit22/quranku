import 'package:flutter/material.dart';
import 'package:quran_stige/shared/utils/colors.dart';

class CustomListTile extends StatelessWidget {
  final String images;
  final String text;

  final Function() onTap;
  const CustomListTile(
      {super.key,
      required this.images,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: grey, width: 1))),
      child: ListTile(
          hoverColor: yellow,
          leading: Image.asset(
            images,
            color: yellow,
            width: 26.0,
            height: 26.0,
          ),
          title: Text(
            text,
            style: const TextStyle(color: white, fontWeight: FontWeight.bold),
          ),
          onTap: onTap),
    );
  }
}
