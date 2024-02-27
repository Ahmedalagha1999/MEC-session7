import 'package:flutter/material.dart';

class MarketContainer extends StatelessWidget {
  const MarketContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE4E2DF),
        ),
      ),
      child: const Row(
        children: [Text("MArket-USD"), Icon(Icons.arrow_drop_down)],
      ),
    );
  }
}
