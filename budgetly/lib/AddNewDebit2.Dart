import 'package:flutter/material.dart';

class DebtsConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Debts Confirmation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Debt was successfully created", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to add more debts
              },
              child: Text("Add more debts"),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to view existing debts
              },
              child: Text("View my debts"),
              style: ElevatedButton.styleFrom(primary: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
