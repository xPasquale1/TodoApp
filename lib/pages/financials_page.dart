import 'package:flutter/material.dart';
import 'package:todo_app/models/financial.dart';
import 'package:todo_app/widgets/financial_widget.dart';

class FinancialsPage extends StatefulWidget {
  const FinancialsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FinancialsPageState();
  }
}

class _FinancialsPageState extends State<FinancialsPage> {
  final List<Financial> financials = [
    Financial(
      id: 0,
      date: DateTime.now(),
      amount: -10,
      receiver: 'Test',
      description: 'Hat gekostet',
    ),
    Financial(
      id: 1,
      date: DateTime.now(),
      amount: 4.5,
      receiver: 'Test 2',
      description: 'Stonks',
    ),
  ];

  void onFinancialPressed(Financial financial) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Financials',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: financials.map((financial) {
          return FinancialWidget(
            financial: financial,
            onPress: (financial) => onFinancialPressed(financial),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
