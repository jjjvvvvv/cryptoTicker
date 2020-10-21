import 'networking.dart';
import 'currency.dart';
import 'package:bitcoin_ticker/price_screen.dart';

const btcAvgURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class CryptoModel {
  Future<dynamic> getPrice(String pair) async {
    NetworkHelper networkHelper = NetworkHelper('$btcAvgURL$pair');
    var priceData = await networkHelper.getData();
    return priceData;
  }

  Future<dynamic> getCurrency() async {
    Currency currency = Currency();
    await currency.getCurrency(currency);

    NetworkHelper networkHelper = NetworkHelper(btcAvgURL);

    var priceData = await networkHelper.getData();

    return priceData;
  }
}
