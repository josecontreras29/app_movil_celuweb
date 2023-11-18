import 'package:flutter/material.dart';

class VendedorItemDefault extends StatelessWidget {
  const VendedorItemDefault(
      {super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      Text(value)
    ]);
  }
}
