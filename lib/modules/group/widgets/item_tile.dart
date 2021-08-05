import 'package:flutter/material.dart';
import 'package:split_it/shared/utils/money_formatter.dart';
import 'package:split_it/theme/app_theme.dart';

class ItemTileWidget extends StatelessWidget {
  final String name;
  final double value;

  const ItemTileWidget({Key? key, required this.name, required this.value})
      : super(key: key);

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
          text: "${value.currencySymbol()} ",
          style: AppTheme.textStyles.currencySymbol,
          children: [
            TextSpan(
                text: value.simpleCurrencyWithoutSimbol(),
                style: AppTheme.textStyles.itemValue)
          ],
        ),
      ),
    );
  }
}
