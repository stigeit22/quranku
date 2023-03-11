import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:quran_stige/shared/utils/next_screen.dart';
import 'package:quran_stige/shared/widgets/custom_item_hadist.dart';

import '../../../model/hadist_tirmizdi_model.dart';

class HadistTirmidziScreen extends StatefulWidget {
  const HadistTirmidziScreen({super.key});

  @override
  State<HadistTirmidziScreen> createState() => _HadistTirmidziScreenState();
}

class _HadistTirmidziScreenState extends State<HadistTirmidziScreen> {
  Future<List<HadistTirmidziModel>> _getHadistTirmidzi() async {
    final String data =
        await rootBundle.loadString('assets/datas/hadist_tirmidzi.json');
    return hadistTirmidziModelFromJson(data);
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
            color: white,
          ),
        ),
        title: const Text(
          "Hadist Tirmidzi",
          style: TextStyle(
            color: white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _getHadistTirmidzi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return _itemHadistTirmidzi(
                  hadistTirmidziModel: snapshot.data!.elementAt(index),
                  context: context);
            },
          );
        },
      ),
    );
  }

  Widget _itemHadistTirmidzi(
      {required HadistTirmidziModel hadistTirmidziModel,
      required BuildContext context}) {
    return CustomItemHadist(
        number: hadistTirmidziModel.number,
        arab: hadistTirmidziModel.arab,
        terjemah: hadistTirmidziModel.id,
        share: hadistTirmidziModel.id,
        share2: hadistTirmidziModel.arab);
  }
}
