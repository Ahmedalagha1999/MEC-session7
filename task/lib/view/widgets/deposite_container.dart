import 'package:flutter/material.dart';
import 'package:task/core/constatns.dart';

class DepositContainer extends StatelessWidget {
  const DepositContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 174,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: containerFirstColor),
      child: const Text(
        "Deposit USD",
        style: TextStyle(
          color: textColor1,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}
