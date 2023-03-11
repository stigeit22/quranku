import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:quran_stige/shared/utils/next_screen.dart';

import '../../../model/surah_model.dart';
import '../../../shared/widgets/item_surah.dart';

class SearchSurah extends StatefulWidget {
  const SearchSurah({super.key});

  @override
  State<SearchSurah> createState() => _SearchSurahState();
}

class _SearchSurahState extends State<SearchSurah> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';
  Future<List<SurahModel>> _getSurah() async {
    String data = await rootBundle.loadString('assets/datas/list_surah.json');
    return surahModelFromJson(data);
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
            color: grey,
            size: 24.0,
          ),
        ),
        actions: [
          AnimSearchBar(
            width: MediaQuery.of(context).size.width,
            textController: _searchController,
            onSuffixTap: () {
              setState(() {
                _searchController.clear();
              });
            },
            onSubmitted: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          )
        ],
      ),
      body: FutureBuilder<List<SurahModel>>(
        future: _getSurah(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                final surah = snapshot.data![index];
                if (searchQuery.isNotEmpty &&
                    !surah.namaLatin.toLowerCase().contains(
                          searchQuery.toLowerCase(),
                        )) {
                  return Container();
                }
                return ItemSurah(
                  surahModel: snapshot.data!.elementAt(index),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Divider(
                    color: grey.withOpacity(0.3),
                  ),
                );
              },
              itemCount: snapshot.data!.length);
        },
      ),
    );
  }
}
