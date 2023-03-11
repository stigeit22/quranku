import 'package:flutter/material.dart';

import '../../shared/utils/colors.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: grey,
            size: 24.0,
          ),
        ),
        title: const Text(
          'Bookmarks',
          style: TextStyle(color: white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.location_on,
                  color: white,
                  size: 24.0,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
