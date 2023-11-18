import 'package:flutter/material.dart';

class BackgroundHome extends StatelessWidget {
  const BackgroundHome({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[500]!, spreadRadius: 1, blurRadius: 2)
            ]),
        padding: const EdgeInsets.all(30),
        child: child);
  }
}
