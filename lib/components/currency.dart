import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Currency {
  Currency._();

  static String? currency;

  static void init() {
    Intl.defaultLocale = PlatformDispatcher.instance.locale.toString();
  }

  static String doubleToString(double amount) {
    return NumberFormat.simpleCurrency(name: currency).format(amount);
  }

  static double stringToDouble(String text) {
    return NumberFormat.simpleCurrency(name: currency).parse(text).toDouble();
  }

  static void changeCurrency(String newCurrency) {
    currency = newCurrency;
  }

  static List<String> getAllCurrencies() {
    return [
      'USD',
      'EUR',
      'JPY',
      'GBP',
      'CNY',
      'CHF',
      'CAD',
      'AUD',
      'NZD',
      'SEK',
      'NOK',
      'DKK',
      'PLN',
      'CZK',
      'HUF',
      'INR',
      'BRL',
      'MXN',
      'KRW',
      'SGD',
    ];
  }
}
