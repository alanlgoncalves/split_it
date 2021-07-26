import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:split_it/modules/home/widgets/icon_dolar_widget.dart';
import 'package:split_it/theme/app_theme.dart';

import 'loading_widget.dart';

class InfoCardWidget extends StatelessWidget {
  final double value;
  final bool isLoading;

  const InfoCardWidget({
    Key? key,
    required this.value,
    required this.isLoading,
  }) : super(key: key);

  String get infoCardTitle => value >= 0 ? "A receber" : "A pagar";

  TextStyle get textStyle => value >= 0
      ? AppTheme.textStyles.infoCardSubtitle1
      : AppTheme.textStyles.infoCardSubtitle2;

  IconDollarType get iconDollarType =>
      value >= 0 ? IconDollarType.RECEIVE : IconDollarType.SEND;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 168,
      decoration: BoxDecoration(
          color: AppTheme.colors.backgroundPrimary,
          borderRadius: BorderRadius.circular(10),
          border:
              Border.fromBorderSide(BorderSide(color: AppTheme.colors.border))),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconDollarWidget(type: iconDollarType),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                infoCardTitle,
                style: AppTheme.textStyles.infoCardTitle,
              ),
              SizedBox(
                height: 4,
              ),
              if (isLoading) ...[
                LoadingWidget(
                  size: Size(94, 24),
                ),
              ] else
                Text(
                  NumberFormat.simpleCurrency().format(value.abs()),
                  style: textStyle,
                ),
            ],
          )
        ],
      ),
    );
  }
}
