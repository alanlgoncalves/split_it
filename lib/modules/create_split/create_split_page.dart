import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/widgets/create_split_appbar.dart';
import 'package:split_it/modules/create_split/widgets/stepper_next_button.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];

  var index = 0;

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
        child: Container(
          height: 60,
          child: Column(
            children: [
              Row(
                children: [
                  StepperNextButtonWidget(
                    label: "Cancelar",
                    onTap: () {},
                  ),
                  Container(
                    width: 0.3,
                    height: 60,
                    color: AppTheme.colors.divider,
                  ),
                  StepperNextButtonWidget(
                    label: "Continuar",
                    onTap: () {
                      nextPage();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
