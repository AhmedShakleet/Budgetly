import 'package:budgetly/bank.dart';
import 'package:budgetly/my%20goal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class newgoal3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.scale(
              scale: 0.8, // Adjust the scale factor as needed
              child: Image.asset('images/goal1.png'), // Replace with your image asset
            ),
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Your goal is created',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Don't forget to monitor your performance on the dashboard and you will definitely be able to achieve your goal",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Add more goals'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => bank(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // background (button) color
                onPrimary: Colors.white, // foreground (text) color
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20), // width and height
              ),
            ),
            SizedBox(height: 25), // Add a SizedBox between the two buttons
            OutlinedButton(
              child: Text('View my goal'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => mygoal(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                primary: Colors.black, // text color
                side: BorderSide(color: Colors.black), // border color
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20), // width and height
              ),
            ),
          ],
        ),
      ),
    );
  }
}