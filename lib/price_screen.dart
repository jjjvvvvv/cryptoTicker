import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/services/tickerData.dart';
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
  CryptoModel crypto = CryptoModel();
  String selectedCurrency;
  String coin;
  double cryptoValue;

  @override
  void initState() {
    super.initState();
    updateUI(widget.priceValue);
  }

  void updateUI(dynamic priceData) {
    setState(() {
      if (priceData == null) {
        selectedCurrency = 'USD';
        coin = 'BTC';
        cryptoValue = 0;
        return;
      }
      cryptoValue = priceData['last'];
    });
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
        setState(() {
          selectedCurrency = value;
        });
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
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.greenAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  // BitcoinAverage API - Ticker Data (Per Symbol)
                  '1 BTC = $cryptoValue $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            foregroundColor: Colors.black,
            onPressed: () async {
              String pair = coin + selectedCurrency.toUpperCase();
              var priceData = await crypto.getPrice();
              updateUI(priceData);
              print('check price');
            },
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.greenAccent,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
