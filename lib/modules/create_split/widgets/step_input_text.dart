import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepInputTextWidget extends StatelessWidget {
  final String hintText;
  final TextAlign textAlign;
  final String? initialText;
  final EdgeInsets? padding;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function(String value) onChange;

  const StepInputTextWidget(
      {Key? key,
      required this.hintText,
      required this.onChange,
      this.controller,
      this.textAlign = TextAlign.center,
      this.padding,
      this.textInputType = TextInputType.text,
      this.initialText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 64),
      child: TextFormField(
        initialValue: initialText,
        keyboardType: textInputType,
        onChanged: onChange,
        style: AppTheme.textStyles.stepperTextField,
        cursorColor: AppTheme.colors.backgroundSecondary,
        textAlign: textAlign,
        controller: controller,
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
