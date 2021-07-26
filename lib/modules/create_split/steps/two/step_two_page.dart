import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/widgets/person_tile.dart';
import 'package:split_it/modules/create_split/widgets/step_input_text.dart';
import 'package:split_it/modules/create_split/widgets/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  final void Function(String value) onChange;

  const StepTwoPage({Key? key, required this.onChange}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
          titleFirstLine: "Com quem",
          titleSecondLine: "você quer dividir?",
        ),
        SizedBox(
          height: 40,
        ),
        StepInputTextWidget(
          hintText: "Nome da pessoa",
          onChange: widget.onChange,
        ),
        SizedBox(
          height: 35,
        ),
        PersonTileWidget(
          name: "Afonso",
          isRemovable: false,
        ),
        PersonTileWidget(
          name: "Alan",
          isRemovable: false,
        ),
        PersonTileWidget(
          name: "José",
          isRemovable: false,
        )
      ],
    );
  }
}
