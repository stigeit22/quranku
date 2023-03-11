import 'package:flutter/material.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:quran_stige/shared/utils/next_screen.dart';
import 'package:quran_stige/screens/home/widget/header_home.dart';
import 'package:quran_stige/screens/home/widget/hijb_tab.dart';
import 'package:quran_stige/screens/home/widget/page_tab.dart';
import 'package:quran_stige/screens/home/widget/para_tab.dart';
import 'package:quran_stige/screens/home/widget/search_surah.dart';
import 'package:quran_stige/screens/home/widget/surah_tab.dart';
import 'package:quran_stige/screens/home/widget/tabbar_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: Image.asset('assets/images/icon_quran.png'),
        title: const Text(
          "Qur'anku",
          style: TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              nextScreen(
                context,
                const SearchSurah(),
              );
            },
            icon: const Icon(
              Icons.search,
              color: grey,
            ),
          )
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverToBoxAdapter(
            child: HeaderHome(),
          ),
        ],
        body: const SurahTab(),
      ),
      // body: DefaultTabController(
      //   length: 4,
      //   child: NestedScrollView(
      //     headerSliverBuilder: (context, innerBoxIsScrolled) => [
      //       const SliverToBoxAdapter(
      //         child: HeaderHome(),
      //       ),
      //       const SliverAppBar(
      //         // shape: Border(
      //         //     bottom: BorderSide(color: purple.withOpacity(0.3))),
      //         backgroundColor: backgroundColor,
      //         elevation: 0,
      //         automaticallyImplyLeading: false,
      //         pinned: true,
      //         primary: true,
      //         bottom: PreferredSize(
      //             preferredSize: Size.fromHeight(0), child: tabbarHome()),
      //       )
      //     ],
      //     body: const TabBarView(
      //       children: [
      //         SurahTab(),
      //         ParaTab(),
      //         PageTab(),
      //         HijbTab(),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
