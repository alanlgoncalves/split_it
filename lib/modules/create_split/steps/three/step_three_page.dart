import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/steps/three/step_three_controller.dart';
import 'package:split_it/modules/create_split/widgets/add_text_button.dart';
import 'package:split_it/modules/create_split/widgets/step_item_input.dart';
import 'package:split_it/modules/create_split/widgets/step_title_widget.dart';

class StepThreePage extends StatefulWidget {
  const StepThreePage({Key? key}) : super(key: key);

  @override
  _StepTheePageState createState() => _StepTheePageState();
}

class _StepTheePageState extends State<StepThreePage> {
  final controller = StepThreeController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StepTitleWidget(
              titleFirstLine: "Qual ou quais",
              titleSecondLine: "itens você quer dividir?"),
          SizedBox(
            height: 40,
          ),
          Observer(
            builder: (_) {
              return StepItemInputTextWidget(
                key: UniqueKey(),
                number: controller.currentIndex,
                onItemNameChange: (name) {
                  controller.onChange(name: name);
                },
                onItemValueChange: (value) {
                  controller.onChange(value: value);
                },
              );
            },
          ),
          SizedBox(
            height: 24,
          ),
          Observer(
            builder: (_) => controller.showAddItemButton
                ? AddTextButtonWidget(
                    label: "Adicionar",
                    onPressed: controller.addItem,
                  )
                : Container(),
          ),
          SizedBox(
            height: 24,
          ),
          Observer(
            builder: (_) {
              return Column(
                children: [
                  for (var i = 0; i < controller.items.length; i++)
                    StepItemInputTextWidget(
                      key: Key(controller.items[i].hashCode.toString()),
                      number: i + 1,
                      initialName: controller.items[i].name,
                      initialValue: controller.items[i].value,
                      onItemNameChange: (name) {
                        controller.editItem(index: i, name: name);
                      },
                      onItemValueChange: (value) {
                        controller.editItem(index: i, value: value);
                      },
                      isRemovable: true,
                      onDelete: () {
                        controller.removeItem(i);
                      },
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
