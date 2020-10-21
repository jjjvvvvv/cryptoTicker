import 'package:bitcoin_ticker/price_screen.dart';
import 'package:flutter/material.dart';

class Currency {
  String currency;

  Future<void> getCurrency(selectedCurrency) {
    try {
      String currency = selectedCurrency;
    } catch (e) {
      print(e);
    }
    return selectedCurrency;
  }
}
