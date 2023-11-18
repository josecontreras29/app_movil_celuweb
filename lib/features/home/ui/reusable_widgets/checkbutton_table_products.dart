import 'package:flutter/material.dart';

class SelectProductCheckButton extends StatefulWidget {
  const SelectProductCheckButton({super.key, required this.action});
  final Function(bool) action;
  @override
  State<SelectProductCheckButton> createState() =>
      _SelectProductCheckButtonState();
}

class _SelectProductCheckButtonState extends State<SelectProductCheckButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Checkbox(
          value: isSelected,
          onChanged: (value) async {
            await widget.action(value!);
            setState(() {
              isSelected = value;
            });
          }),
    );
  }
}
