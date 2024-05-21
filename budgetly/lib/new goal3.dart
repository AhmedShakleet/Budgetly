import 'package:flutter/material.dart';
import 'package:budgetly/bank.dart';
import 'my goal.dart';

class NewGoal3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.scale(
              scale: 0.8,
              child: Image.asset('images/goal1.png'),
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
                    builder: (context) => BankSynchronizationScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
              ),
            ),
            SizedBox(height: 25),
            OutlinedButton(
              child: Text('View my goal'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyGoal(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                side: BorderSide(color: Colors.black),
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
