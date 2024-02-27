import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constatns.dart';
import 'package:task/model/crypto_model.dart';
import 'package:task/view/widgets/deposite_container.dart';
import 'package:task/view/widgets/withdrew_container.dart';
import 'package:task/view_model/providers/crypto_provider.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 366,
                    height: 196,
                    decoration: BoxDecoration(
                      color:
                          containerFirstColor, // Using hexadecimal color code
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius for rounded corners
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Portfolio",
                            style: TextStyle(
                              color: textColor1,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            "Holding value",
                            style: TextStyle(
                              color: textColor1,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$2,420.69",
                                style: TextStyle(
                                  color: textColor1,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5, left: 5),
                                child: Text(
                                  "+13.25%",
                                  style: TextStyle(color: textColor1),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Invested value",
                                      style: TextStyle(
                                        color: textColor1,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      "\$1,328.00",
                                      style: TextStyle(
                                        color: textColor1,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ]),

                              const SizedBox(
                                  width: 10), // Adjust the width as needed
                              Container(
                                  width: 1,
                                  height: 38,
                                  color: Colors.white // Set the color as needed
                                  ),
                              SizedBox(width: 10), // Adjust the width as needed

                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Available USD",
                                    style: TextStyle(
                                      color: textColor1,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    "\$1268",
                                    style: TextStyle(
                                      color: textColor1,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [DepositContainer(), WithdrawContainer()],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 15),
                child: Text(
                  "Your coins",
                  style: headerText,
                ),
              ),
              Expanded(
                child: Consumer<CryptoProvider>(
                  builder: (context, provider, _) {
                    return ListView.separated(
                      itemCount: provider.myCryptoCurrencies.length,
                      itemBuilder: (context, index) {
                        CryptoCurrency crypto =
                            provider.myCryptoCurrencies[index];
                        double changeValue =
                            double.tryParse(crypto.change) ?? 0.0;

                        // Determine text color based on change
                        Color changeColor =
                            changeValue >= 0 ? Colors.green : Colors.red;
                        return Material(
                          elevation: 3, // Add elevation for shadow effect
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 366,
                            height: 72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    crypto.imagePath,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        crypto.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "(${crypto.abbreviation})",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(child: Image.asset(crypto.trending)),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "\$${crypto.cost.toString()}",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        "${crypto.change}%",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: changeColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8), // Adjust spacing as needed
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 5,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
