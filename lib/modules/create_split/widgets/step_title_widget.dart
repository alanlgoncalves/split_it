import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepTitleWidget extends StatelessWidget {
  final String titleFirstLine;
  final String titleSecondLine;

  const StepTitleWidget(
      {Key? key, required this.titleFirstLine, required this.titleSecondLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: "$titleFirstLine\n",
            style: AppTheme.textStyles.stepperTitlePrimary,
            children: [
              TextSpan(
                text: titleSecondLine,
                style: AppTheme.textStyles.stepperTitleSecondary,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
