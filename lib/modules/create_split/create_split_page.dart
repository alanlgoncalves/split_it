import 'package:flutter/material.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppTheme.colors.stepperBackButton,
                  ),
                  onPressed: () {
                    backPage();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text.rich(
                  TextSpan(
                    text: "0${index + 1}",
                    style: AppTheme.textStyles.stepperIndicatorPrimary,
                    children: [
                      TextSpan(
                        text: " - 0${pages.length}",
                        style: AppTheme.textStyles.stepperIndicatorSecondary,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Center(child: pages[index]),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Cancelar",
                            style: AppTheme.textStyles.button,
                          ))),
                  Container(
                    width: 0.3,
                    height: 60,
                    color: AppTheme.colors.divider,
                  ),
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            nextPage();
                          },
                          child: Text(
                            "Continuar",
                            style: AppTheme.textStyles.button,
                          ))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
