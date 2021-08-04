import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgProvider;
import 'package:intl/intl.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitSuccessPage extends StatelessWidget {
  final CreateSplitController controller;

  const CreateSplitSuccessPage({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF40B38C),
              Color(0xFF45CC93),
            ],
            transform: GradientRotation(2.35619),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/money-logo.png",
                  width: 240,
                  height: 240,
                ),
              ],
            ),
            SizedBox(
              height: 48,
            ),
            Column(
              children: [
                Text(
                  "${controller.event.friends.length} pessoas",
                  style: AppTheme.textStyles.successPageText,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    NumberFormat.simpleCurrency(locale: "pt_BR")
                        .format(controller.event.splitValue),
                    style: AppTheme.textStyles.successPageValue,
                  ),
                ),
                Text(
                  "Para cada um",
                  style: AppTheme.textStyles.successPageText,
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.event.friends
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
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
                              fit: e.photoURL != null
                                  ? BoxFit.cover
                                  : BoxFit.none),
                          color: AppTheme.colors.checkboxActive,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
      //gradient(135deg, #40B38C 0%, #45CC93 100%);
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF40B38C),
                Color(0xFF45CC93),
              ],
              transform: GradientRotation(2.35619),
            ),
          ),
          height: 76,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OKAY :D",
                  style: AppTheme.textStyles.successPageButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
