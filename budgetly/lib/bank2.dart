import 'package:budgetly/bank3.dart';
import 'package:flutter/material.dart';
class bank2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BankSynchronizationScreen(),
    );
  }
}

class BankSynchronizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank synchronization'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Spacer(),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey.shade800,
            child: Text('mono', style: TextStyle(color: Colors.white)), // Placeholder for logo
          ),
          SizedBox(height: 8),
          Text(
            'Monobank USD',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'USD',
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'After you click "Next":\n'
                  '1. You will be redirected to the Monobank application.\n'
                  '2. The Monobank application will ask for your permission '
                  'to give MyBudget access to read your statement and balance. Click "Confirm".\n'
                  '3. Choose the accounts you want to connect.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: double.infinity, // Make the button full width
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => bank3(),
                    ),
                  );
                },
                child: Text('Next'),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
