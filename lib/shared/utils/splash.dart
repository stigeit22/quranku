import 'package:flutter/material.dart';
import 'package:quran_stige/shared/utils/colors.dart';
import 'package:quran_stige/shared/utils/navigations_screen.dart';
import 'package:quran_stige/sreens/home/homescreen.dart';

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
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Quran App",
                  style: TextStyle(
                    fontSize: 28.0,
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Learn Quran \n and Recite once everyday",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 450,
                      decoration: BoxDecoration(
                        color: purple,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Image.asset('assets/images/quran.png'),
                    ),
                    Positioned(
                      bottom: -23,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigationScreen(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40.0),
                          height: 56.0,
                          decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 24.0,
                                color: backgroundColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
