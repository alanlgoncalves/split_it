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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  backPage();
                },
              ),
              Text.rich(
                TextSpan(
                  text: "${index + 1}",
                  style: AppTheme.textStyles.stepperIndicatorPrimary,
                  children: [
                    TextSpan(
                      text: " - ${pages.length}",
                      style: AppTheme.textStyles.stepperIndicatorSecondary,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Center(child: pages[index]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nextPage();
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
