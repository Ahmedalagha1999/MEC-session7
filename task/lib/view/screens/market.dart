import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constatns.dart';
import 'package:task/model/crypto_model.dart';
import 'package:task/view/widgets/market_container.dart';
import 'package:task/view_model/providers/crypto_provider.dart';

class MarketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black, // Change color as needed
                                  height: 1.0,
                                  letterSpacing: 0.0,
                                  textBaseline: TextBaseline.alphabetic,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Market is down ',
                                  ),
                                  TextSpan(
                                    text: '-8.21%',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              "In the past 24 hours",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xFF7D756C),
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.search),
                      ],
                    ),
                    SizedBox(height: 30), // Adjust spacing as needed
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coins",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        MarketContainer(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10), // Adjust spacing as needed
              const TabBar(
                labelColor: containerFirstColor,
                indicatorColor: containerFirstColor, // Change color as needed
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Gainer'),
                  Tab(text: 'Loser'),
                  Tab(text: 'Favorites'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Your tab views go here
                    // For each tab, you can have a different widget
                    // For example:
                    Consumer<CryptoProvider>(
                      builder: (context, provider, _) {
                        return ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 23),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                    Expanded(
                                        child: Image.asset(crypto.trending)),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "\$${crypto.cost.toString()}",
                                            style:
                                                const TextStyle(fontSize: 12),
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
                    Container(
                        color: Colors.green,
                        child: Center(child: Text('Gainer'))),
                    Container(
                        color: Colors.red, child: Center(child: Text('Loser'))),
                    Container(
                        color: Colors.yellow,
                        child: Center(child: Text('Favorites'))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
