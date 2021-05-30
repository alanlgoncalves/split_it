import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class SocialButtonWidget extends StatelessWidget {
  final String imagePath;
  final String label;

  const SocialButtonWidget(
      {Key? key, required this.imagePath, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(color: AppTheme.colors.border),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 57,
            height: 56,
            child: Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                Image.asset(
                  imagePath,
                  width: 24,
                  height: 24,
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: 1,
                  color: AppTheme.colors.border,
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          Text(
            label,
            style: AppTheme.textStyles.button,
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
