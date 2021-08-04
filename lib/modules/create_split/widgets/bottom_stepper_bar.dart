import 'package:bot_toast/bot_toast.dart';
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

  void showMessage() {
    switch (controller.currentPage) {
      case 0:
        BotToast.showText(text: "Digite o nome do evento");
        break;
      case 1:
        BotToast.showText(text: "Escolha ao menos uma pessoa");
        break;
      case 2:
        BotToast.showText(text: "Adicione ao menos um item");
        break;
      default:
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
                  onTap:
                      controller.enableNavigateButton ? onTapNext : showMessage,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
