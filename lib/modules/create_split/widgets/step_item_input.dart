import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:split_it/modules/create_split/widgets/step_input_text.dart';

class StepItemInputTextWidget extends StatefulWidget {
  final int number;
  final String? initialName;
  final double? initialValue;
  final bool isRemovable;
  final ValueChanged<String> onItemNameChange;
  final ValueChanged<double> onItemValueChange;

  StepItemInputTextWidget(
      {Key? key,
      required this.number,
      required this.onItemNameChange,
      required this.onItemValueChange,
      this.isRemovable = false,
      this.initialName,
      this.initialValue})
      : super(key: key);

  @override
  _StepItemInputTextWidgetState createState() =>
      _StepItemInputTextWidgetState();
}

class _StepItemInputTextWidgetState extends State<StepItemInputTextWidget> {
  late MoneyMaskedTextController moneyController = MoneyMaskedTextController(
    initialValue: widget.initialValue,
    leftSymbol: NumberFormat.simpleCurrency(locale: "pt_BR").currencySymbol,
    decimalSeparator: NumberFormat.simpleCurrency().symbols.DECIMAL_SEP,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text("${widget.number}"),
          ),
          Expanded(
            flex: 3,
            child: StepInputTextWidget(
                initialText: this.widget.initialName,
                hintText: "Ex: Picanha",
                textAlign: TextAlign.start,
                padding: EdgeInsets.zero,
                onChange: widget.onItemNameChange),
          ),
          Expanded(
            child: StepInputTextWidget(
              hintText: NumberFormat.simpleCurrency().format(0),
              textAlign: TextAlign.start,
              padding: EdgeInsets.zero,
              textInputType: TextInputType.number,
              controller: moneyController,
              onChange: (value) {
                widget.onItemValueChange(moneyController.numberValue);
              },
            ),
          ),
          if (widget.isRemovable)
            IconButton(icon: Icon(Icons.delete), onPressed: () {}),
        ],
      ),
    );
  }
}
