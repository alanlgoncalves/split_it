import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/widgets/step_input_text.dart';
import 'package:split_it/modules/create_split/widgets/step_title_widget.dart';

class StepOnePage extends StatefulWidget {
  final void Function(String value) onChange;

  const StepOnePage({Key? key, required this.onChange}) : super(key: key);

  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends State<StepOnePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
          titleFirstLine: "Qual o nome",
          titleSecondLine: "do evento?",
        ),
        SizedBox(
          height: 40,
        ),
        StepInputTextWidget(
          hintText: "Ex: Churrasco",
          onChange: widget.onChange,
        ),
      ],
    );
  }
}
