// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_stige/model/doa_puasa_model.dart';
import 'package:quran_stige/shared/widgets/item_doa_puasa.dart';
import 'package:share_plus/share_plus.dart';

import '../../../shared/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class DoaPuasaSreenDetails extends StatefulWidget {
  const DoaPuasaSreenDetails({Key? key}) : super(key: key);

  @override
  State<DoaPuasaSreenDetails> createState() => _DoaPuasaSreenDetailsState();
}

class _DoaPuasaSreenDetailsState extends State<DoaPuasaSreenDetails> {
  Future<DoaPuasaModel> _getDoaPuasa() async {
    String data =
        await rootBundle.loadString('assets/datas/list_doa_puasa.json');
    return doaPuasaModelFromJson(data);
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
          "Do'a Puasa",
          style: TextStyle(color: white),
        ),
      ),
      body: FutureBuilder<DoaPuasaModel>(
        future: _getDoaPuasa(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.builder(
            itemCount: snapshot.data!.data.length,
            itemBuilder: (context, index) {
              return ItemDoaPuasa(
                puasa: snapshot.data!.data.elementAt(index),
              );
            },
          );
        },
      ),
    );
  }
}
