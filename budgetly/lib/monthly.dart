import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import services to use input formatters

class Monthely extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monthely Budget UI',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MonthlyScreen(),
    );
  }
}

class MonthlyScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly budget'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'What is your monthly budget?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  prefixText: '\$ ',
                  hintText: 'Enter your monthly income',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true), // Allow decimal numbers
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')), // Allow digits and 2 decimals
                ],
                style: TextStyle(fontSize: 24, color: Colors.green),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle the Next button functionality
                },
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white), // Set text color to white
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
