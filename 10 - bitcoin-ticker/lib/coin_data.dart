import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String _apiKey = "B6F7416B-5BC6-4F65-9FD8-3027E6348ADA";
  String _baseUrl = "https://rest.coinapi.io/v1/exchangerate";

  String btcValue = "?";
  String ethValue = "?";
  String ltcValue = "?";

  Map<String, Map<String, String>> values = {};

  CoinData() {
    for (String currency in currenciesList) {
      values[currency] = {};
      for (String crypto in cryptoList) {
        values[currency][crypto] = "?";
      }
    }
    print(values);
  }

  Future<void> updateChange(String target) async {
    for (String crypto in cryptoList) {
      if (values[target][crypto] == "?") {
        values[target][crypto] =
            await _getChange(source: crypto, target: target);
      }
    }
  }

  Future<String> _getChange({String source, String target}) async {
    var response =
        await http.get(Uri.parse("$_baseUrl/$source/$target?apikey=$_apiKey"));
    var tmp = convert.jsonDecode(response.body)["rate"];
    return tmp != null ? tmp.toStringAsFixed(0) : "?";
  }
}
