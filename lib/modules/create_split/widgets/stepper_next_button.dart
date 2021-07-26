import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepperNextButtonWidget extends StatelessWidget {
  final String label;
  final bool enabled;
  final VoidCallback? onTap;

  const StepperNextButtonWidget(
      {Key? key, required this.label, required this.onTap, this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: this.enabled ? onTap : null,
        child: Text(
          label,
          style: this.enabled
              ? AppTheme.textStyles.stepperNextButton
              : AppTheme.textStyles.stepperNextButtonDisabled,
        ),
      ),
    );
  }
}
