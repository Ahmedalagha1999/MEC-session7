import 'package:flutter/material.dart';
import 'package:task/model/crypto_model.dart';
import 'package:task/core/managers/image_maneger/image_maneger.dart';
import 'package:task/model/dummy_data.dart';

class CryptoProvider extends ChangeNotifier {
  List<CryptoCurrency> get cryptoCurrencies => cryptoCurrenciesdata;

  List<CryptoCurrency> get myCryptoCurrencies {
    // Filter the list to show only the cryptocurrencies where mycoin is true
    return cryptoCurrenciesdata
        .where((crypto) => crypto.mycoin == true)
        .toList();
  }

  void addCryptoCurrency(CryptoCurrency cryptoCurrency) {
    cryptoCurrencies.add(cryptoCurrency);
    notifyListeners();
  }

  void removeCryptoCurrency(int index) {
    cryptoCurrencies.removeAt(index);
    notifyListeners();
  }

  void updateCryptoCurrency(int index, CryptoCurrency cryptoCurrency) {
    if (index >= 0 && index < cryptoCurrencies.length) {
      cryptoCurrencies[index] = cryptoCurrency;
      notifyListeners();
    }
  }
}
