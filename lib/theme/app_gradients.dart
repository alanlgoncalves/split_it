import 'dart:math';

import 'package:flutter/cupertino.dart';

abstract class AppGradients {
  // Splash Page
  Gradient get background;
}

class AppGradientsDefault implements AppGradients {
  @override
  Gradient get background => LinearGradient(colors: [
        Color(0xFF40B38C),
        Color(0xFF45CC93),
      ], stops: [
        0,
        1
      ], transform: GradientRotation(2.35619 * pi));
}
