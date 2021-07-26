import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:split_it/modules/create_split/widgets/step_input_text.dart';
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text("1"),
              ),
              Expanded(
                flex: 3,
                child: StepInputTextWidget(
                    hintText: "Ex: Picanha",
                    textAlign: TextAlign.start,
                    padding: EdgeInsets.zero,
                    onChange: (eventName) {}),
              ),
              Expanded(
                child: StepInputTextWidget(
                    hintText: NumberFormat.simpleCurrency().format(0),
                    textAlign: TextAlign.start,
                    padding: EdgeInsets.zero,
                    onChange: (eventName) {}),
              ),
              IconButton(icon: Icon(Icons.delete), onPressed: () {}),
            ],
          ),
        )
      ],
    );
  }
}
