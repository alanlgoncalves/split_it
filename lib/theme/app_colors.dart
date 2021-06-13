import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundPrimary;
  Color get backgroundSecondary;
  Color get title;
  Color get button;
  Color get border;
  Color get border2;
  Color get appBarTitle;
  Color get icon;
}

class AppColorsDefault implements AppColors {
  @override
  Color get backgroundPrimary => Color(0xFFFFFFFF);

  @override
  Color get backgroundSecondary => Color(0xFF40b38C);

  @override
  Color get title => Color(0xFF45CC93);

  @override
  Color get button => Color(0xFF666666);

  @override
  Color get border => Color(0xFFDCE0E5);

  @override
  Color get border2 => Color(0xFFFFFFFF);

  @override
  Color get appBarTitle => Color(0xFFFFFFFF);

  @override
  Color get icon => Color(0xFFF5F5F5);
}
