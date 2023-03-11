import 'package:flutter/material.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_stige/model/hadist_muslim_model.dart';
import 'package:quran_stige/shared/utils/colors.dart';

import '../../../shared/utils/next_screen.dart';
import '../../../shared/widgets/custom_item_hadist.dart';

class HadistMuslimScreen extends StatefulWidget {
  const HadistMuslimScreen({Key? key}) : super(key: key);

  @override
  State<HadistMuslimScreen> createState() => _HadistMuslimScreenState();
}

class _HadistMuslimScreenState extends State<HadistMuslimScreen> {
  Future<List<HadistMuslimModel>> _getHadistBukhari() async {
    String data =
        await rootBundle.loadString('assets/datas/hadist_bukhari.json');
    return hadistMuslimModelFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Hadist Muslim",
          style: TextStyle(color: white),
        ),
      ),
      backgroundColor: backgroundColor,
      body: FutureBuilder<List<HadistMuslimModel>>(
        future: _getHadistBukhari(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return _itemHadistMuslim(
                  hadistMuslimModel: snapshot.data!.elementAt(index),
                  context: context);
            },
          );
        },
      ),
    );
  }

  Widget _itemHadistMuslim(
      {required HadistMuslimModel hadistMuslimModel,
      required BuildContext context}) {
    return CustomItemHadist(
        number: hadistMuslimModel.number,
        arab: hadistMuslimModel.arab,
        terjemah: hadistMuslimModel.id,
        share: hadistMuslimModel.id,
        share2: hadistMuslimModel.arab);
  }
}
