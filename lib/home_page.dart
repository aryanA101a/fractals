import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fractals/chaos_game_fractal.dart';
import 'package:fractals/constants.dart';
import 'package:fractals/home_page_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 9,
              child: Container(
                height: 500,
                padding: EdgeInsets.all(14),
                child: context.watch<HomePageViewModel>().currentFractal,
                decoration: BoxDecoration(
                    color: screenBgColor,
                    borderRadius: BorderRadius.all(Radius.circular(18))),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          scrollDirection: Axis.vertical,
                          enlargeCenterPage: true,
                          viewportFraction: .6,
                          onPageChanged: (page, reason) {
                            context
                                .read<HomePageViewModel>()
                                .setCurrentFractal(Fractal.values[page]);
                          }),
                      items: ["ChaosGame", "Test Fractal"].map((sort) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(color: btnColor),
                                child: Text(
                                  sort,
                                  style: TextStyle(
                                      fontSize: 16.0, color: btnTextColor),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                    // MaterialButton(
                    //   height: MediaQuery.of(context).size.height * .12,
                    //   elevation: 0,
                    //   color: btnColor,
                    //   onPressed: isRunning
                    //       ? context.read<HomePageViewModel>().stop
                    //       : context.read<HomePageViewModel>().start,
                    //   child: Icon(
                    //     isRunning
                    //         ? Icons.pause_rounded
                    //         : Icons.play_arrow_rounded,
                    //     color: btnTextColor,
                    //   ),
                    //   shape: CircleBorder(),
                    // ),
                    MaterialButton(
                      height: MediaQuery.of(context).size.height * .12,
                      elevation: 0,
                      color: btnColor,
                      textColor: btnTextColor,
                      onPressed: context.read<HomePageViewModel>().reset,
                      child: Icon(
                        Icons.replay_rounded,
                        color: btnTextColor,
                      ),
                      shape: CircleBorder(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
      //  Center(
      // child: Container(
      //   color: Color.fromARGB(255, 17, 22, 80),
      //   height: MediaQuery.of(context).size.height * .9,
      //   width: MediaQuery.of(context).size.width * .9,
      //   child: CustomPaint(foregroundPainter: Fractal()),
      // ),
      // ),
    );
  }
}
