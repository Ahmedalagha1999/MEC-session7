import 'package:task/model/crypto_model.dart';
import 'package:task/core/managers/image_maneger/image_maneger.dart';

final List<CryptoCurrency> cryptoCurrenciesdata = [
  CryptoCurrency(
    name: "Bitcoin",
    imagePath: ImageManager.cryptoImage1,
    abbreviation: "BTC",
    cost: 45000,
    change: "-0.5",
    trending: ImageManager.vectorImage1,
    mycoin: true,
  ),
  CryptoCurrency(
    name: "Ethereum",
    imagePath: ImageManager.cryptoImage2,
    abbreviation: "ETH",
    cost: 3000,
    change: "+2.0",
    trending: ImageManager.vectorImage2,
  ),
  CryptoCurrency(
    name: "Litecoin",
    imagePath: ImageManager.cryptoImage3,
    abbreviation: "LTC",
    cost: 150,
    change: "+1.5",
    trending: ImageManager.vectorImage3,
    mycoin: true,
  ),
  CryptoCurrency(
    name: "Ripple",
    imagePath: ImageManager.cryptoImage4,
    abbreviation: "XRP",
    cost: 1.2,
    change: "-0.2",
    trending: ImageManager.vectorImage4,
  ),
  CryptoCurrency(
    name: "Cardano",
    imagePath: ImageManager.cryptoImage5,
    abbreviation: "ADA",
    cost: 2.5,
    change: "+0.8",
    trending: ImageManager.vectorImage1,
  ),
  CryptoCurrency(
    name: "Polkadot",
    imagePath: ImageManager.cryptoImage6,
    abbreviation: "DOT",
    cost: 40,
    change: "-1.0",
    trending: ImageManager.vectorImage2,
    mycoin: true,
  ),
];
