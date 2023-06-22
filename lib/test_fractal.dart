import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fractals/constants.dart';
import 'package:fractals/utils.dart';
import 'package:funvas/funvas.dart';

class TestFractal extends StatelessWidget {
  const TestFractal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FunvasContainer(funvas: Tff());
  }
}

class Tff extends Funvas {
  bool isInit = false;
  List<Pair> points = [];
  var random = Random();
  var current;
  var paint;

  void init() {
    var center = x.size / 2;
    randomHeight() => (x.size * random.nextDouble()).height;
    randomWidth() => (x.size * random.nextDouble()).width;
    var n = 5;
    for (int i = 0; i < n; i++) {
      var angle = i * (360 / n);
      var radians = angle * (pi / 180);
      var loc = Pair((cos(radians)), sin(radians));
      loc.x *= 200;
      loc.y *= 200;
      loc.x += center.width;
      loc.y += center.height;

      print(loc);

      points.add(loc);
    }
    current = Pair(lerpDouble(points[0].x, points[1].x, random.nextDouble())!,
        lerpDouble(points[0].y, points[1].y, random.nextDouble())!);

    paint = Paint()..color = btnColor;
    c.drawCircle(Offset(current.x, current.y), 1, paint);

    for (int i = 0; i < n; i++) {
      c.drawCircle(Offset(points[i].x, points[i].y), 1, paint);
    }
    isInit = true;
  }

  @override
  void u(double t) {
    if (!isInit) {
      init();
    }
    // var previous;
    // var next = points[random.nextInt(points.length)];
    // if (next != previous) {
    //   current.x = lerpDouble(current.x, next.x, .5)!;
    //   current.y = lerpDouble(current.y, next.y, .5)!;

    //   c.drawCircle(Offset(current.x, current.y), .5, paint);
    // }
    // previous = next;
  }
}
