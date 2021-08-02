import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/widgets/step_item_input.dart';
import 'package:split_it/modules/create_split/widgets/step_title_widget.dart';

class StepTheePage extends StatefulWidget {
  const StepTheePage({Key? key}) : super(key: key);

  @override
  _StepTheePageState createState() => _StepTheePageState();
}

class _StepTheePageState extends State<StepTheePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
            titleFirstLine: "Qual ou quais",
            titleSecondLine: "itens você quer dividir?"),
        SizedBox(
          height: 40,
        ),
        StepItemInputTextWidget(
          number: 0,
          onItemNameChange: (value) {},
          onItemValueChange: (value) {},
        ),
      ],
    );
  }
}
