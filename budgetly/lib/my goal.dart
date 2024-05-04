import 'package:budgetly/bank.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class mygoal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goal Detail',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: GoalDetailScreen(),
    );
  }
}

class GoalDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {}, // Handle back button
        ),
        title: Text('My goal'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {}, // Handle edit button
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Buy Jackson PRO', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('29 Aug 2023', style: TextStyle(color: Colors.grey)),
                LinearProgressIndicator(
                  value: 0.57, // Current progress
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                Text('Total amount: \$1,200', style: TextStyle(fontSize: 16)),
                Text('Accumulated: \$683 / 57%', style: TextStyle(fontSize: 16)),
                Text('Left: \$517 / 43%', style: TextStyle(fontSize: 16)),
                SizedBox(height: 24),
                Text('Note', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('This instrument opens up new horizons in playing possibilities', style: TextStyle(fontSize: 16)),
                SizedBox(height: 24),
                ElevatedButton.icon(
                  icon: Icon(Icons.add), // Replace with custom icon
                  label: Text('Add money'),
                  onPressed: () {}, // Handle add money
                ),
                SizedBox(height: 24),
                Text('Transaction history', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TransactionTile(),
                TransactionTile(),
                TransactionTile(), // Add more transaction tiles as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(Icons.attach_money), // Replace with the appropriate icon
      ),
      title: Text('Cash'),
      subtitle: Text('\$145.00 - 2 day left'),
      trailing: Icon(Icons.more_vert), // For transaction options
    );
  }
}
