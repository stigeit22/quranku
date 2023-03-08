import 'package:flutter/material.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:quran_stige/sreens/home/widget/header_home.dart';
import 'package:quran_stige/sreens/home/widget/hijb_tab.dart';
import 'package:quran_stige/sreens/home/widget/page_tab.dart';
import 'package:quran_stige/sreens/home/widget/para_tab.dart';
import 'package:quran_stige/sreens/home/widget/surah_tab.dart';
import 'package:quran_stige/sreens/home/widget/tabbar_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: grey,
          ),
        ),
        title: const Text(
          "Qur'anku",
          style: TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: grey,
            ),
          )
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverToBoxAdapter(
              child: HeaderHome(),
            ),
            const SliverAppBar(
              // shape: Border(
              //     bottom: BorderSide(color: purple.withOpacity(0.3))),
              backgroundColor: backgroundColor,
              elevation: 0,
              automaticallyImplyLeading: false,
              pinned: true,
              primary: true,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0), child: tabbarHome()),
            )
          ],
          body: const TabBarView(
            children: [
              SurahTab(),
              ParaTab(),
              PageTab(),
              HijbTab(),
            ],
          ),
        ),
      ),
    );
  }
}
