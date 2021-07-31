import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepInputTextWidget extends StatelessWidget {
  final String hintText;
  final String? text;
  final TextAlign textAlign;
  final EdgeInsets? padding;
  final void Function(String value) onChange;

  const StepInputTextWidget(
      {Key? key,
      required this.hintText,
      required this.onChange,
      this.text,
      this.textAlign = TextAlign.center,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 64),
      child: TextField(
        onChanged: onChange,
        style: AppTheme.textStyles.stepperTextField,
        cursorColor: AppTheme.colors.backgroundSecondary,
        textAlign: textAlign,
        controller: TextEditingController(text: this.text),
        decoration: InputDecoration(
          hintText: hintText,
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
    );
  }
}
