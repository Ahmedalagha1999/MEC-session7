import 'package:flutter/material.dart';
import 'package:task/core/constatns.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366,
      height: 209,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: containerFirstColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/images/logo.png"),
          const Text(
            "Giorgi Togonidze",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: textColor1,
              fontSize: 20,
            ),
          ),
          const Text(
            "Newuser420@gmail.com",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: textColor1,
              fontSize: 12,
            ),
          ),
          const Text(
            "+995 555 420 069",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: textColor1,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
