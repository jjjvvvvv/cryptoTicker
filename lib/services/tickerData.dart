import 'networking.dart';

const btcAvgURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class CryptoModel {
  Future<dynamic> getPrice(String pair) async {
    NetworkHelper networkHelper = NetworkHelper('$btcAvgURL$pair');
    var priceData = await networkHelper.getData();
    return priceData;
  }
}
