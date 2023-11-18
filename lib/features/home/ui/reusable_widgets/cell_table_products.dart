
import 'package:flutter/material.dart';

class CellTableProducts extends StatelessWidget {
  const CellTableProducts(
      {super.key, required this.value, required this.width});
  final String value;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 2),
        width: width,
        child: Text(value, overflow: TextOverflow.ellipsis));
  }
}
