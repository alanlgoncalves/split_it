import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/widgets/stepper_next_button.dart';
import 'package:split_it/theme/app_theme.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onTapNext;
  final VoidCallback onTapCancel;
  final bool enableButtons;

  const BottomStepperBarWidget(
      {Key? key,
      required this.onTapNext,
      required this.onTapCancel,
      this.enableButtons = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Column(
        children: [
          Row(
            children: [
              StepperNextButtonWidget(
                label: "Cancelar",
                enabled: enableButtons,
                onTap: enableButtons ? onTapCancel : null,
              ),
              Container(
                width: 0.3,
                height: 60,
                color: AppTheme.colors.divider,
              ),
              StepperNextButtonWidget(
                label: "Continuar",
                enabled: enableButtons,
                onTap: enableButtons ? onTapNext : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
