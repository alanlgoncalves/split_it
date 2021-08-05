import 'package:flutter/material.dart';
import 'package:split_it/shared/utils/money_formatter.dart';
import 'package:split_it/theme/app_theme.dart';

class PersonTileWidget extends StatefulWidget {
  final String name;
  final double value;

  const PersonTileWidget({Key? key, required this.name, required this.value})
      : super(key: key);

  @override
  _PersonTileWidgetState createState() => _PersonTileWidgetState();
}

class _PersonTileWidgetState extends State<PersonTileWidget> {
  bool? isChecked;

  Color get checkboxColor => isChecked!
      ? AppTheme.colors.checkboxActive
      : AppTheme.colors.checkboxInactive;

  Color get checkboxBorderColor => isChecked!
      ? AppTheme.colors.checkboxBorderActive
      : AppTheme.colors.checkboxBorderInactive;

  TextStyle get valueTextStyle => isChecked!
      ? AppTheme.textStyles.personValuePositive
      : AppTheme.textStyles.personValueNegative;

  @override
  void initState() {
    isChecked = !widget.value.isNegative;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200,
          ),
        ),
        title: Text(
          this.widget.name,
          style: AppTheme.textStyles.personName,
        ),
        subtitle: Text(
          widget.value.abs().simpleCurrency(),
          style: valueTextStyle,
        ),
        trailing: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: checkboxColor,
            border: Border.fromBorderSide(
              BorderSide(
                width: 1,
                color: checkboxBorderColor,
              ),
            ),
          ),
          child: Checkbox(
            activeColor: Color(0xFF40B38C),
            onChanged: (bool? value) {
              isChecked = value;
              setState(() {});
            },
            value: isChecked,
          ),
        ));
  }
}
