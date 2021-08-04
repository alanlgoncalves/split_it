import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgProvider;
import 'package:intl/intl.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/theme/app_theme.dart';

class StepFourPage extends StatelessWidget {
  final CreateSplitController controller;

  const StepFourPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundSecondary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/money-logo.svg",
                width: 240,
                height: 240,
              ),
            ],
          ),
          Text("${controller.event.friends.length} pessoas"),
          Text(
            NumberFormat.simpleCurrency(locale: "pt_BR")
                .format(controller.event.splitValue),
          ),
          Text("Para cada um"),
          Row(
            children: controller.event.friends
                .map(
                  (e) => Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: e.photoURL != null
                              ? NetworkImage(e.photoURL!)
                              : svgProvider.Svg(
                                  "assets/images/default-user-avatar.svg",
                                  size: Size(28, 28)) as ImageProvider,
                          fit: e.photoURL != null ? BoxFit.cover : BoxFit.none),
                      color: AppTheme.colors.checkboxActive,
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
