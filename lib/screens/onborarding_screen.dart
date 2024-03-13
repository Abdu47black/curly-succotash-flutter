import 'package:cleancodeig/screens/intro_page_screens/intro_page_screen_1.dart';
import 'package:cleancodeig/screens/intro_page_screens/intro_page_screens_2.dart';
import 'package:cleancodeig/screens/intro_page_screens/intro_page_screens_3.dart';
import 'package:cleancodeig/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: camel_case_types
class onBoardingScreens extends StatefulWidget {
  const onBoardingScreens({super.key});

  @override
  State<onBoardingScreens> createState() => onBoardingScreensState();
}

// ignore: camel_case_types
class onBoardingScreensState extends State<onBoardingScreens> {
  PageController pcontroller = PageController();
  bool islastpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Text('skip'),
          PageView(
            controller: pcontroller,
            onPageChanged: (index) {
              setState(() {
                islastpage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SmoothPageIndicator(
                  controller: pcontroller,
                  count: 3,
                ),

                //next page
                islastpage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          pcontroller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.bounceIn);
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
