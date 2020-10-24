import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/services/tickerData.dart';
import 'coin_card.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  PriceScreen({this.priceValue});

  final priceValue;
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency;
  double btcValue;
  double ethValue;
  double ltcValue;

  @override
  void initState() {
    super.initState();
    updateUI(widget.priceValue, widget.priceValue, widget.priceValue);
  }

  // todo: make app update prices for default USD on start
  void updateUI(dynamic priceData1, dynamic priceData2, dynamic priceData3) {
    setState(() {
      if (priceData1 == null || priceData2 == null || priceData3 == null) {
        selectedCurrency = 'USD';
        btcValue = 0;
        ethValue = 0;
        ltcValue = 0;
        return;
      }
      btcValue = priceData1['last'];
      ethValue = priceData2['last'];
      ltcValue = priceData3['last'];
    });
  }

  CryptoModel crypto = CryptoModel();

  // todo: At some point I do want to consolidate these methods. The issue I was running into was that when I could only display one getPrice for all of the coins. Not sure how to fix this atm but I would like to return to it at some point.

  Future<dynamic> askBTC(String selectedCurrency) async {
    String pair = 'BTC' + selectedCurrency.toUpperCase();
    var priceData = await crypto.getPrice(pair);
    return priceData;
  }

  Future<dynamic> askETH(String selectedCurrency) async {
    String pair = 'ETH' + selectedCurrency.toUpperCase();
    var priceData = await crypto.getPrice(pair);
    return priceData;
  }

  Future<dynamic> askLTC(String selectedCurrency) async {
    String pair = 'LTC' + selectedCurrency.toUpperCase();
    var priceData = await crypto.getPrice(pair);
    return priceData;
  }

  Future<dynamic> updateAll() async {
    var priceData1 = await askBTC(selectedCurrency);
    var priceData2 = await askETH(selectedCurrency);
    var priceData3 = await askLTC(selectedCurrency);
    updateUI(priceData1, priceData2, priceData3);
  }

  DropdownButton<String> androidDropdown() {
    // This method could be very useful for the product list cards
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(
          currency,
        ),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(
          () async {
            selectedCurrency = value;
            var priceData1 = await askBTC(selectedCurrency);
            var priceData2 = await askETH(selectedCurrency);
            var priceData3 = await askLTC(selectedCurrency);
            updateUI(priceData1, priceData2, priceData3);
          },
        );
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String item in currenciesList) {
      pickerItems.add(
        Text(
          item,
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex].toString();
          updateAll();
        });
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 CRYPTO TICKER 🤑'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          coinCard('BTC', btcValue, selectedCurrency),
          coinCard('ETH', ethValue, selectedCurrency),
          coinCard('LTC', ltcValue, selectedCurrency),
        ],
      ),
      bottomNavigationBar: Container(
        height: 150.0,
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 30.0),
        color: Colors.greenAccent,
        child: Platform.isIOS ? iOSPicker() : androidDropdown(),
      ),
    );
  }
}
