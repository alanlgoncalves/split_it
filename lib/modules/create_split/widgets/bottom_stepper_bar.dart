import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/widgets/stepper_next_button.dart';
import 'package:split_it/theme/app_theme.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final CreateSplitController controller;

  const BottomStepperBarWidget({Key? key, required this.controller})
      : super(key: key);

  void onTapNext() {
    if (controller.currentPage == 2) {
      controller.saveEvent();
    } else {
      controller.nextPage();
    }
  }

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
                    onTap: () {
                      Navigator.pop(context);
                    });
              }),
              Container(
                width: 0.3,
                height: 60,
                color: AppTheme.colors.divider,
              ),
              Observer(builder: (_) {
                return StepperNextButtonWidget(
                  label:
                      controller.currentPage == 2 ? "Finalizar" : "Continuar",
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
