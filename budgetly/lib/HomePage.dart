import 'package:budgetly/AddNewDebit.dart';
import 'package:budgetly/Expense.dart';
import 'package:budgetly/FoodPage3.dart';
import 'package:budgetly/monthly.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'new goal.dart';
import 'bank.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    title: 'Budget App',
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text("Hi, Name", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Exit Application?'),
              content: Text('Do you want to close the app?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel', style: TextStyle(color: Colors.green)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text('OK', style: TextStyle(color: Colors.red)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),

        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.list),
              onPressed: () => Scaffold.of(context).openEndDrawer(), // Opens the Drawer from the right side
            ),
          ),
        ],
      ),
      endDrawer: Drawer( // Drawer on the right side
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.local_dining),
              title: Text('My Diet'),
              onTap: () {
                Navigator.pop(context); // Closes the Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DietPlanScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.flag),
              title: Text('My Goals'),
              onTap: () {
                Navigator.pop(context);
                // Add your action here
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('My Expenses'),
              onTap: () {
                Navigator.pop(context);
                // Add your action here
              },
            ),
            ListTile(
              leading: Icon(Icons.money_off),
              title: Text('My Debts'),
              onTap: () {
                Navigator.pop(context);
                // Add your action here
              },
            ),
            ListTile(
              leading: Icon(Icons.fastfood),
              title: Text('Food Recipes'),
              onTap: () {
                Navigator.pop(context);

              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              MonthlyBalance(),
              SizedBox(height: 20),
              ExpenseCategoryChart(),
              SizedBox(height: 20),
              buildActionButton(context, "Add New Goal", Icons.add, () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewGoalPage()))),
              buildActionButton(context, "Add New Debit", Icons.credit_card, () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewDebtPage()))),
              buildActionButton(context, "Add New Expense", Icons.money_off, () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpensePage()))), // Add appropriate navigation or function
              buildActionButton(context, "Add Bank Account", Icons.account_balance, () => Navigator.push(context, MaterialPageRoute(builder: (context) => bank()))),
              buildActionButton(context, "Add Monthly Budget", Icons.calendar_today, () => Navigator.push(context, MaterialPageRoute(builder: (context) => Monthely()))), // Add appropriate navigation or function
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActionButton(BuildContext context, String text, IconData icon, VoidCallback onPressed) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.white, // Background color
            onPrimary: Colors.black, // Text color
            padding:
            EdgeInsets.symmetric(vertical: 20),
            textStyle: TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.green),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(text, style: TextStyle(color: Colors.black)),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(icon, color: Colors.green, size: 24),
              ),
            ],
          ),
        ));
  }
}

class MonthlyBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Monthly Balance: \$20,000", style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: 0.55, // Assuming $11,000 is 55% of $20,000
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          SizedBox(height: 4),
          Text("Remaining: \$11,000", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class ExpenseCategoryChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Electronics": 1000,
      "Education": 1400,
      "Eating out": 500,
      "Clothes": 900,
    };
    return Card(
      child: PieChart(
        dataMap: dataMap,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3.2,
        colorList: [Colors.blue, Colors.orange, Colors.green, Colors.red],
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        centerText: "Expenses",
        legendOptions: LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: true,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: false,
          showChartValuesOutside: false,
        ),
      ),
    );
  }
}
