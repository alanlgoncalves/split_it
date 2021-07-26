import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_page.dart';
import 'package:split_it/modules/create_split/widgets/bottom_stepper_bar.dart';
import 'package:split_it/modules/create_split/widgets/create_split_appbar.dart';
import 'package:split_it/theme/app_theme.dart';

import 'steps/one/step_one_page.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController();
  late List<Widget> pages;

  var index = 0;

  @override
  void initState() {
    pages = [
      StepOnePage(onChange: (eventName) {
        controller.setEventName(eventName);
        setState(() {});
      }),
      StepTwoPage(onChange: (eventName) {
        setState(() {});
      }),
      Container(
        color: Colors.yellow,
      ),
    ];

    super.initState();
  }

  void nextPage() {
    if (index < 2) {
      index++;
      setState(() {});
    }
  }

  void backPage() {
    if (index > 0) {
      index--;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: CreateSplitAppbarWidget(
        actualPage: index,
        size: pages.length,
        onTapBack: backPage,
      ),
      body: Center(child: pages[index]),
      bottomNavigationBar: SafeArea(
          child: BottomStepperBarWidget(
        enableButtons: controller.enableNavigateButton(),
        onTapCancel: () {},
        onTapNext: nextPage,
      )),
    );
  }
}
