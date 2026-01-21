import 'package:daily_app/components/currency.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  void onCurrencySelected(String? currency) {
    if (currency == null) return;
    Currency.changeCurrency(currency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade900,
        ),
        child: DropdownMenu<String>(
          label: Text(
            'Currency',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          width: double.infinity,
          dropdownMenuEntries: Currency.getAllCurrencies()
              .map(
                (currency) =>
                    DropdownMenuEntry(value: currency, label: currency),
              )
              .toList(),
          onSelected: onCurrencySelected,
        ),
      ),
    );
  }
}
