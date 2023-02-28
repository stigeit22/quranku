import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
          icon: Icon(
            Icons.menu,
            color: purple,
          ),
        ),
        title: Text(
          "Quran App",
          style: TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
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
            SliverToBoxAdapter(
              child: HeaderHome(),
            ),
            SliverAppBar(
              // shape: Border(
              //     bottom: BorderSide(color: purple.withOpacity(0.3))),
              backgroundColor: backgroundColor,
              elevation: 0,
              automaticallyImplyLeading: false,
              pinned: true,
              primary: true,
              bottom: PreferredSize(
                  child: TabbarHome(), preferredSize: Size.fromHeight(0)),
            )
          ],
          body: TabBarView(
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
