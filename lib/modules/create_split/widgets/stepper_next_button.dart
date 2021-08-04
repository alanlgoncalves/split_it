import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepperNextButtonWidget extends StatelessWidget {
  final String label;
  final bool enabled;
  final bool hightlight;
  final VoidCallback? onTap;

  const StepperNextButtonWidget(
      {Key? key,
      required this.label,
      required this.onTap,
      this.enabled = true,
      this.hightlight = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 60,
          child: Center(
            child: Text(
              label,
              style: this.enabled
                  ? this.hightlight
                      ? AppTheme.textStyles.stepperNextButton.copyWith(
                          color: AppTheme.colors.stepperNextHighlighted)
                      : AppTheme.textStyles.stepperNextButton
                  : AppTheme.textStyles.stepperNextButtonDisabled,
            ),
          ),
        ),
      ),
    );
  }
}
