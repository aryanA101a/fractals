import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:fractals/chaos_game_fractal.dart';
import 'package:fractals/test_fractal.dart';

enum Fractal {
  chaosGame,
  testFractal,
}

class HomePageViewModel with ChangeNotifier {
  late Widget _currentFractal = ChaosGameFractal();
  Widget get currentFractal => _currentFractal;
  setCurrentFractal(Fractal fractal) {
    switch (fractal) {
      case Fractal.chaosGame:
        _currentFractal = ChaosGameFractal();
        break;
      case Fractal.testFractal:
        _currentFractal = TestFractal();

        break;
      default:
    }
    notifyListeners();
  }

  reset() {
    notifyListeners();
  }

  // HomePageViewModel() {

  // }
}
