import 'package:flutter/material.dart';
import 'package:task/core/constatns.dart';

class TodayContainer extends StatelessWidget {
  const TodayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: const Text(
        "Invest Today",
        style: TextStyle(color: textColor2),
      ),
    );
  }
}
