import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class bank4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Synchronization',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BankSyncPeriodSelectionScreen(),
    );
  }
}

class BankSyncPeriodSelectionScreen extends StatefulWidget {
  @override
  _BankSyncPeriodSelectionScreenState createState() => _BankSyncPeriodSelectionScreenState();
}

class _BankSyncPeriodSelectionScreenState extends State<BankSyncPeriodSelectionScreen> {
  String selectedPeriod = 'last6Months'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Bank synchronization', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Select the transaction synchronization period', style: TextStyle(fontSize: 16)),
          ),
          RadioListTile<String>(
            title: const Text('Last 6 months'),
            value: 'last6Months',
            groupValue: selectedPeriod,
            onChanged: (value) {
              setState(() => selectedPeriod = value ?? selectedPeriod);
            },
          ),
          RadioListTile<String>(
            title: const Text('Last 3 months'),
            value: 'last3Months',
            groupValue: selectedPeriod,
            onChanged: (value) {
              setState(() => selectedPeriod = value ?? selectedPeriod);
            },
          ),
          RadioListTile<String>(
            title: const Text('Last month'),
            value: 'lastMonth',
            groupValue: selectedPeriod,
            onChanged: (value) {
              setState(() => selectedPeriod = value ?? selectedPeriod);
            },
          ),
          RadioListTile<String>(
            title: const Text('This month'),
            value: 'thisMonth',
            groupValue: selectedPeriod,
            onChanged: (value) {
              setState(() => selectedPeriod = value ?? selectedPeriod);
            },
          ),
          RadioListTile<String>(
            title: const Text('Last year'),
            value: 'lastYear',
            groupValue: selectedPeriod,
            onChanged: (value) {
              setState(() => selectedPeriod = value ?? selectedPeriod);
            },
          ),
          RadioListTile<String>(
            title: const Text('Select a period'),
            value: 'selectPeriod',
            groupValue: selectedPeriod,
            onChanged: (value) {
              setState(() => selectedPeriod = value ?? selectedPeriod);
              // Handle custom period selection here
            },
          ),
          Spacer(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green,
                textStyle: TextStyle(fontSize: 16),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {
                // Proceed to the next screen or perform the synchronization
              },
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
