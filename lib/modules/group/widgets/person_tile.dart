import 'package:flutter/material.dart';

class PersonTileWidget extends StatefulWidget {
  final String name;
  final bool isRemovable;

  const PersonTileWidget(
      {Key? key, required this.name, this.isRemovable = false})
      : super(key: key);

  @override
  _PersonTileWidgetState createState() => _PersonTileWidgetState();
}

class _PersonTileWidgetState extends State<PersonTileWidget> {
  bool? isChecked = false;

  Color get checkboxColor => isChecked! ? Color(0xFFE0F3EE) : Color(0xFFF0F1F1);
  Color get checkboxBorderColor =>
      isChecked! ? Color(0xFFD6D6D6) : Color(0xFFF0F1F1);

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
        title: Text(this.widget.name),
        subtitle: Text("R\$126,00"),
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
