import 'package:flutter/material.dart';

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_stige/model/hadist_ibnu_majah_model.dart';
import 'package:quran_stige/shared/utils/colors.dart';

import '../../../shared/utils/next_screen.dart';
import '../../../shared/widgets/custom_item_hadist.dart';

class HadistIbnuMajahScreen extends StatefulWidget {
  const HadistIbnuMajahScreen({Key? key}) : super(key: key);

  @override
  State<HadistIbnuMajahScreen> createState() => _HadistIbnuMajahScreenState();
}

class _HadistIbnuMajahScreenState extends State<HadistIbnuMajahScreen> {
  Future<List<HadistIbnuMajahModel>> _getHadistIbnuMajah() async {
    final String data =
        await rootBundle.loadString('assets/datas/hadist_ibnu_majah.json');
    return hadistIbnuMajahModelFromJson(data);
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
            "Hadist Ibnu Majah",
            style: TextStyle(color: white),
          ),
        ),
        body: FutureBuilder(
          future: _getHadistIbnuMajah(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return _itemHadistIbnuMajah(
                    hadistIbnuMajahModel: snapshot.data!.elementAt(index),
                    context: context);
              },
            );
          },
        ));
  }

  Widget _itemHadistIbnuMajah(
      {required HadistIbnuMajahModel hadistIbnuMajahModel,
      required BuildContext context}) {
    return CustomItemHadist(
        number: hadistIbnuMajahModel.number,
        arab: hadistIbnuMajahModel.arab,
        terjemah: hadistIbnuMajahModel.id,
        share: hadistIbnuMajahModel.id,
        share2: hadistIbnuMajahModel.arab);
  }
}
