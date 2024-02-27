import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constatns.dart';
import 'package:task/model/crypto_model.dart';
import 'package:task/view/widgets/today_container.dart';
import 'package:task/view_model/providers/crypto_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    height: 141,
                    decoration: BoxDecoration(
                      color:
                          containerFirstColor, // Using hexadecimal color code
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius for rounded corners
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 19),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Giorgi,",
                            style: TextStyle(color: textColor1),
                          ),
                          Text(
                            "Make your first investment today",
                            style: TextStyle(color: textColor1),
                          ),
                          TodayContainer(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Image.asset("assets/images/Shape.png"),
                    right: 10,
                    top: 6,
                  ),
                  Positioned(
                    child: Image.asset("assets/images/Group.png"),
                    right: 100,
                    bottom: -20,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 20),
                child: Text(
                  "Trending Coins",
                  style: headerText,
                ),
              ),
              Expanded(
                child: Consumer<CryptoProvider>(
                  builder: (context, provider, _) {
                    return ListView.separated(
                      itemCount: provider.cryptoCurrencies.length,
                      itemBuilder: (context, index) {
                        CryptoCurrency crypto =
                            provider.cryptoCurrencies[index];
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
                                        style: const TextStyle(fontSize: 12),
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
                                const SizedBox(
                                    width: 8), // Adjust spacing as needed
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
