import 'package:flutter/material.dart';

import '../../../shared/utils/colors.dart';

class TabbarHome extends StatelessWidget {
  const TabbarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorColor: purple,
        isScrollable: true,
        labelColor: white,
        labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        unselectedLabelColor: grey,
        tabs: [
          Tab(
            text: 'Surah',
          ),
          Tab(
            text: 'Para',
          ),
          Tab(
            text: 'Page',
          ),
          Tab(
            text: 'Hijb',
          ),
        ]);
  }
}
