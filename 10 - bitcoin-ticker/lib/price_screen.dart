import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
  CoinData cd = new CoinData();

  DropdownButton<String> getDropdownButton() {
    List<DropdownMenuItem<String>> items = [];

    for (String data in currenciesList) {
      items.add(DropdownMenuItem(
        child: Text(data),
        value: data,
      ));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: items,
      onChanged: (value) async {
        await cd.updateChange(value);
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker getCupertinoPicker() {
    List<Text> items = [];

    for (String data in currenciesList) {
      items.add(Text(data));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      onSelectedItemChanged: (selectedIndex) async {
        var value = currenciesList[selectedIndex];
        await cd.updateChange(value);
        setState(() {
          selectedCurrency = value;
        });
      },
      itemExtent: 32.0,
      children: items,
    );
  }

  List<Widget> getCryptos() {
    List<Widget> cards = [];

    cryptoList.forEach((crypto) {
      cards.add(
        Card(
          color: Colors.lightBlueAccent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 $crypto = ${cd.values[selectedCurrency][crypto]} $selectedCurrency',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    });

    return cards;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: getCryptos(),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getCupertinoPicker() : getDropdownButton(),
          ),
        ],
      ),
    );
  }
}
