import 'package:flutter/material.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_stige/model/doa_model.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../../shared/widgets/item_doa_harian.dart';

class DoaharianScreenDetails extends StatefulWidget {
  const DoaharianScreenDetails({Key? key}) : super(key: key);

  @override
  State<DoaharianScreenDetails> createState() => _DoaharianScreenDetailsState();
}

class _DoaharianScreenDetailsState extends State<DoaharianScreenDetails> {
  Future<DoaHarianModel> _getDoa() async {
    String data =
        await rootBundle.loadString('assets/datas/list_doa_harian.json');
    return doaHarianModelFromJson(data);
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
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 24.0,
            color: white,
          ),
        ),
        title: const Text(
          "Do'a Harian",
          style: TextStyle(color: white),
        ),
        actions: const [],
      ),
      body: FutureBuilder<DoaHarianModel>(
        future: _getDoa(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.builder(
            itemCount: snapshot.data!.data.length,
            itemBuilder: (context, index) {
              return ItemDoaHarian(
                doa: snapshot.data!.data.elementAt(index),
              );
            },
          );
        },
      ),
    );
  }
}
