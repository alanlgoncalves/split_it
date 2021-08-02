import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_controller.dart';
import 'package:split_it/modules/create_split/widgets/person_tile.dart';
import 'package:split_it/modules/create_split/widgets/step_input_text.dart';
import 'package:split_it/modules/create_split/widgets/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  const StepTwoPage({Key? key}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  final controller = StepTwoController();

  @override
  void initState() {
    this.controller.getFriends();

    super.initState();
  }

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
            hintText: "Nome da pessoa", onChange: controller.onChange),
        SizedBox(
          height: 35,
        ),
        Observer(builder: (_) {
          if (controller.items.isEmpty) {
            return Text("Nenhum amigo(a) encontrado");
          } else {
            return Column(
              children: controller.items
                  .map((e) => PersonTileWidget(name: e['name']))
                  .toList(),
            );
          }
        }),
      ],
    );
  }
}
