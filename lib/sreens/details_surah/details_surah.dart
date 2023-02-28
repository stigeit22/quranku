import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quran_stige/shared/utils/colors.dart';

class DetailsSurah extends StatelessWidget {
  final int noSurah;
  final String namelatin;
  const DetailsSurah(
      {super.key, required this.noSurah, required this.namelatin});
  Future _getDetailSurah() async {
    var data = await Dio().get("https://equran.id/api/surat/$noSurah");
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 24.0,
            color: white,
          ),
        ),
        title: Text(
          namelatin,
          style: TextStyle(color: white, fontWeight: FontWeight.bold),
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
      body: SafeArea(
        child: Text(
          "$noSurah",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
