import 'package:flutter/material.dart';

abstract class AppColors {
  Color get background;
}

class AppColorsDefault implements AppColors {
  @override
  // TODO: implement background
  Color get background => Color(0xFF40b38C);
}
