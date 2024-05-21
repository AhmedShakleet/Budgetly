import 'package:budgetly/bank2.dart';
import 'package:flutter/material.dart';
class bank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Synchronization UI',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BankSynchronizationScreen(),
    );
  }
}

class BankSynchronizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            // Handle close action
          },
        ),
        title: Text('Bank synchronization'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(),
            Image.asset(
              'images/bank.png', // Replace with your asset image
              width:250, // Set the width as needed
              height: 250, // Set the height as needed
            ),
            Text(
              'Benefits of synchronizing with online banking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'It is convenient\n'
                  'We import transaction history and will sync new payments automatically\n\n'
                  'It is safe\n'
                  'When synchronizing, only one have access to view your '
                  'transactions in the application, and neither we nor third parties '
                  'will have access to your data',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              child: Text('Choose A Bank'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => bank2(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green, // foreground (text) color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // width and height
              ),
            ),
             // Add a SizedBox between the two buttons
            OutlinedButton(
              child: Text('Learn More'),
              onPressed: () {
                // Handle navigation
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black, side: BorderSide(color: Colors.black), // border color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // width and height
              ),
            ),
          ],
        ),
      ),
    );
  }
}