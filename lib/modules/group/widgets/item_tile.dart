import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:split_it/theme/app_theme.dart';

class ItemTileWidget extends StatelessWidget {
  final String name;
  final double value;

  const ItemTileWidget({Key? key, required this.name, required this.value})
      : super(key: key);

  String get currency =>
      NumberFormat.simpleCurrency().format(this.value).toString().split(" ")[0];

  String get formattedValue =>
      NumberFormat.simpleCurrency().format(this.value).toString().split(" ")[1];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        name,
        style: AppTheme.textStyles.itemName,
      ),
      trailing: Text.rich(
        TextSpan(
          text: "$currency ",
          style: AppTheme.textStyles.currencySymbol,
          children: [
            TextSpan(text: formattedValue, style: AppTheme.textStyles.itemValue)
          ],
        ),
      ),
    );
  }
}
