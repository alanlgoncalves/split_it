import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

enum IconDollarType { SEND, RECEIVE }

class IconDollarWidget extends StatelessWidget {
  final IconDollarType type;

  const IconDollarWidget({Key? key, required this.type}) : super(key: key);

  String get imagePath =>
      "assets/images/dollar-${IconDollarType.RECEIVE == type ? 'receive' : 'send'}.png";

  Color get background => IconDollarType.RECEIVE == type
      ? AppTheme.colors.iconBackground1
      : AppTheme.colors.iconBackground2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 48,
      height: 48,
      child: Center(
        child: Image.asset(
          imagePath,
          width: 32,
          height: 32,
        ),
      ),
    );
  }
}
