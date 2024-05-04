import 'package:budgetly/bank4.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class bank3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Synchronization',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BankSyncScreen(),
    );
  }
}

class BankAccount {
  final String accountName;
  final String balance;
  final bool isSelected;

  BankAccount({
    required this.accountName,
    required this.balance,
    this.isSelected = false,
  });
}

class BankSyncScreen extends StatefulWidget {
  @override
  _BankSyncScreenState createState() => _BankSyncScreenState();
}

class _BankSyncScreenState extends State<BankSyncScreen> {
  final List<BankAccount> accounts = [
    BankAccount(accountName: 'Mono USD, Black', balance: '\$4500,00'),
    BankAccount(accountName: 'Mono USD, Black', balance: '\$65,54'),
    BankAccount(accountName: 'Mono USD, Black', balance: '\$13,67'),
  ];

  int? _selectedAccountIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank synchronization'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                var account = accounts[index];
                return ListTile(
                  leading: _selectedAccountIndex == index
                      ? Icon(Icons.radio_button_checked, color: Colors.green)
                      : Icon(Icons.radio_button_unchecked, color: Colors.grey),
                  title: Text(account.accountName),
                  subtitle: Text(account.balance),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    setState(() {
                      _selectedAccountIndex = index;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green, // foreground
                minimumSize: Size(double.infinity, 50), // width and height
              ),
              onPressed: _selectedAccountIndex != null
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => bank4(),
                  ),
                );
              }
                  : null,
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
