import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/widgets/stepper_next_button.dart';
import 'package:split_it/theme/app_theme.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onTapNext;
  final VoidCallback onTapCancel;
  final CreateSplitController controller;

  const BottomStepperBarWidget(
      {Key? key,
      required this.onTapNext,
      required this.onTapCancel,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Column(
        children: [
          Row(
            children: [
              Observer(builder: (_) {
                return StepperNextButtonWidget(
                  label: "Cancelar",
                  enabled: controller.enableNavigateButton,
                  onTap: controller.enableNavigateButton ? onTapCancel : null,
                );
              }),
              Container(
                width: 0.3,
                height: 60,
                color: AppTheme.colors.divider,
              ),
              Observer(builder: (_) {
                return StepperNextButtonWidget(
                  label: "Continuar",
                  enabled: controller.enableNavigateButton,
                  onTap: controller.enableNavigateButton ? onTapNext : null,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
