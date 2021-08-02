import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:split_it/modules/create_split/widgets/step_input_text.dart';

class StepItemInputTextWidget extends StatelessWidget {
  final int number;
  final ValueChanged<String> onItemNameChange;
  final ValueChanged<double> onItemValueChange;

  StepItemInputTextWidget(
      {Key? key,
      required this.number,
      required this.onItemNameChange,
      required this.onItemValueChange})
      : super(key: key);

  final moneyController = MoneyMaskedTextController(
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
            child: Text("1"),
          ),
          Expanded(
            flex: 3,
            child: StepInputTextWidget(
                hintText: "Ex: Picanha",
                textAlign: TextAlign.start,
                padding: EdgeInsets.zero,
                onChange: onItemNameChange),
          ),
          Expanded(
            child: StepInputTextWidget(
              hintText: NumberFormat.simpleCurrency().format(0),
              textAlign: TextAlign.start,
              padding: EdgeInsets.zero,
              textInputType: TextInputType.number,
              textEditingController: moneyController,
              onChange: (value) {
                onItemValueChange(moneyController.numberValue);
              },
            ),
          ),
          IconButton(icon: Icon(Icons.delete), onPressed: () {}),
        ],
      ),
    );
  }
}
