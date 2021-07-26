import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

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
        Text.rich(
          TextSpan(
            text: "Qual o nome \n",
            style: AppTheme.textStyles.stepperTitlePrimary,
            children: [
              TextSpan(
                text: "do evento?",
                style: AppTheme.textStyles.stepperTitleSecondary,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: TextField(
            onChanged: widget.onChange,
            style: AppTheme.textStyles.stepperTextField,
            cursorColor: AppTheme.colors.backgroundSecondary,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Ex: Churrasco",
              hintStyle: AppTheme.textStyles.stepperHintTextField,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.colors.inputBorder),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.colors.inputBorder),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.colors.inputBorder),
              ),
            ),
          ),
        )
      ],
    );
  }
}
