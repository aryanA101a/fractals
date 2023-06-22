import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fractals/constants.dart';
import 'package:fractals/home_page_viewmodel.dart';
import 'package:fractals/utils.dart';
import 'package:provider/provider.dart';

class ChaosGameFractalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var random = Random();
    var center = size / 2;
    randomHeight() => (size * random.nextDouble()).height;
    randomWidth() => (size * random.nextDouble()).width;
    List<Pair> points = [];
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
    var current = Pair(
        lerpDouble(points[0].x, points[1].x, random.nextDouble())!,
        lerpDouble(points[0].y, points[1].y, random.nextDouble())!);

    var paint = Paint()..color = btnColor;
    canvas.drawCircle(Offset(current.x, current.y), 1, paint);

    for (int i = 0; i < n; i++) {
      canvas.drawCircle(Offset(points[i].x, points[i].y), 1, paint);
    }
    void render(List<Pair<dynamic>> points, Random random, Pair<double> current,
        Canvas canvas, Paint paint) {
      var previous;
      for (int i = 0; i < 200000; i++) {
        var next = points[random.nextInt(points.length)];
        if (next != previous) {
          current.x = lerpDouble(current.x, next.x, .5)!;
          current.y = lerpDouble(current.y, next.y, .5)!;

          canvas.drawCircle(Offset(current.x, current.y), .5, paint);
        }
        previous = next;
      }
    }

    render(points, random, current, canvas, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ChaosGameFractal extends StatelessWidget {
  const ChaosGameFractal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Consumer<HomePageViewModel>(
        builder: (context, value, child) => CustomPaint(
            size: Size(400, 500), foregroundPainter: ChaosGameFractalPainter()),
      ),
    );
  }
}
