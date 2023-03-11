import 'package:flutter/material.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:quran_stige/shared/utils/navigations_screen.dart';
import 'package:quran_stige/shared/utils/next_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(150.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: backgroundColor,
                  child: Column(
                    children: [
                      const Text(
                        "Quranku",
                        style: TextStyle(
                          fontSize: 28.0,
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Image.asset(
                        'assets/images/icon_quran.png',
                        width: 64.0,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const Text(
                        "Tilawah, Murottal \n Terjemah, Tahfidz",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                )),
          )
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31.0),
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 548,
                  decoration: BoxDecoration(
                    color: yellow.withOpacity(.6),
                    borderRadius: BorderRadius.circular(30.0),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/splash.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  bottom: -23,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      nextScreen(
                        context,
                        const NavigationScreen(),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40.0),
                      height: 56.0,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: const Center(
                        child: Text(
                          "Yu Di Mulai",
                          style: TextStyle(
                            fontSize: 24.0,
                            color: blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
