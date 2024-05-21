import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyGoal extends StatelessWidget {
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

class Transaction {
  double amount;
  DateTime date;

  Transaction({required this.amount, required this.date});
}

class GoalDetailScreen extends StatefulWidget {
  @override
  _GoalDetailScreenState createState() => _GoalDetailScreenState();
}

class _GoalDetailScreenState extends State<GoalDetailScreen> {
  double accumulated = 0;
  final double goalAmount = 10000;
  List<Transaction> transactions = [];
  final TextEditingController _amountController = TextEditingController();

  void addTransaction(double amount) {
    if (amount > 0 && (accumulated + amount) <= goalAmount) {
      setState(() {
        accumulated += amount;
        transactions.add(Transaction(amount: amount, date: DateTime.now()));
      });
    }
  }

  void deleteTransaction(int index) {
    setState(() {
      accumulated -= transactions[index].amount;
      transactions.removeAt(index);
    });
  }

  void editTransaction(int index) async {
    TextEditingController editController = TextEditingController(text: transactions[index].amount.toString());
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Transaction"),
          content: TextField(
            controller: editController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: "Enter new amount",
            ),
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Save"),
              onPressed: () {
                double? newAmount = double.tryParse(editController.text);
                if (newAmount != null && newAmount > 0 && (accumulated - transactions[index].amount + newAmount) <= goalAmount) {
                  setState(() {
                    accumulated = accumulated - transactions[index].amount + newAmount;
                    transactions[index].amount = newAmount;
                    transactions[index].date = DateTime.now(); // Optionally update the date
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('My Goal'),
        backgroundColor: Colors.green,
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
                  value: accumulated / goalAmount,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                Text('Total amount: \$${goalAmount.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
                Text('Accumulated: \$${accumulated.toStringAsFixed(2)} / ${((accumulated / goalAmount) * 100).toStringAsFixed(2)}%', style: TextStyle(fontSize: 16)),
                Text('Left: \$${(goalAmount - accumulated).toStringAsFixed(2)} / ${((1 - accumulated / goalAmount) * 100).toStringAsFixed(2)}%', style: TextStyle(fontSize: 16)),
                SizedBox(height: 24),
                TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: 'Add money',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        double? amount = double.tryParse(_amountController.text);
                        if (amount != null) {
                          addTransaction(amount);
                        }
                      },
                    ),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(height: 24),
                Text('Transaction history', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.attach_money),
                      ),
                      title: Text('\$${transactions[index].amount.toStringAsFixed(2)}'),
                      subtitle: Text('Added on ${DateFormat('dd MMM yyyy').format(transactions[index].date)}'),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'Edit') {
                            editTransaction(index);
                          } else if (value == 'Delete') {
                            deleteTransaction(index);
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'Edit',
                            child: Text('Edit'),
                          ),
                          PopupMenuItem(
                            value: 'Delete',
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
