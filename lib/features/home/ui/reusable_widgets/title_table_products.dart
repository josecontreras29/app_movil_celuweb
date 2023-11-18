import 'package:flutter/material.dart';

class TitleTableProducts extends StatelessWidget {
  const TitleTableProducts(
      {super.key, required this.value, required this.width});
  final String value;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 2),
        width: width,
        child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)));
  }
}
