import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_stige/model/hadist_bukhari_model.dart';
import 'package:quran_stige/shared/utils/next_screen.dart';
import 'package:quran_stige/shared/widgets/custom_item_hadist.dart';

import '../../../shared/utils/colors.dart';

class HadistBukhari extends StatefulWidget {
  const HadistBukhari({super.key});

  @override
  State<HadistBukhari> createState() => _HadistBukhariState();
}

class _HadistBukhariState extends State<HadistBukhari> {
  Future<List<HadistBukhariModel>> _getHadistBukhari() async {
    String data =
        await rootBundle.loadString('assets/datas/hadist_bukhari.json');
    return hadistBukahriModelFromJson(data);
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
          "Hadist Bukhari",
          style: TextStyle(color: white),
        ),
      ),
      backgroundColor: backgroundColor,
      body: FutureBuilder<List<HadistBukhariModel>>(
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
              return _itemHadistBukhari(
                  hadistBukhariModel: snapshot.data!.elementAt(index),
                  context: context);
            },
          );
        },
      ),
    );
  }

  Widget _itemHadistBukhari(
      {required HadistBukhariModel hadistBukhariModel,
      required BuildContext context}) {
    return CustomItemHadist(
        number: hadistBukhariModel.number,
        arab: hadistBukhariModel.arab,
        terjemah: hadistBukhariModel.id,
        share: hadistBukhariModel.id,
        share2: hadistBukhariModel.arab);
  }
}
