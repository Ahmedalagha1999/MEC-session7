import 'package:flutter/material.dart';
import 'package:task/core/constatns.dart';

class WithdrawContainer extends StatelessWidget {
  const WithdrawContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 174,
      height: 48,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: containerFirstColor),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      child: const Text(
        "Withdraw USD",
        style: TextStyle(
          color: textColor2,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}
