import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_stige/model/niat_sholat_model.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:quran_stige/shared/utils/next_screen.dart';

import '../../../shared/widgets/item_niat_sholat.dart';

class NiatSholatScreen extends StatefulWidget {
  const NiatSholatScreen({super.key});

  @override
  State<NiatSholatScreen> createState() => _NiatSholatScreenState();
}

class _NiatSholatScreenState extends State<NiatSholatScreen> {
  Future<List<NiatSholatModel>> _getNiatSholat() async {
    String data =
        await rootBundle.loadString('assets/datas/list_niat_sholat.json');

    return niatSholatModelFromJson(data);
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
            popScreen(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 24.0,
            color: grey,
          ),
        ),
        title: const Text(
          "Niat Sholat Fardhu",
          style: TextStyle(color: white),
        ),
      ),
      body: FutureBuilder(
        future: _getNiatSholat(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                return ItemNiatSholat(
                  niatSholatModel: snapshot.data!.elementAt(index),
                );
              },
              separatorBuilder: (context, index) {
                return Container();
              },
              itemCount: snapshot.data!.length);
        },
      ),
    );
  }
}
