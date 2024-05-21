import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'new goal3.dart'; // تأكد من صحة المسار

class NewGoal2 extends StatelessWidget {
  final String goalName;
  final String note;
  final DateTime targetDate;

  NewGoal2({required this.goalName, required this.note, required this.targetDate});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Goal',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: NewGoalScreen(goalName: goalName, note: note, targetDate: targetDate),
    );
  }
}

class NewGoalScreen extends StatefulWidget {
  final String goalName;
  final String note;
  final DateTime targetDate;

  NewGoalScreen({required this.goalName, required this.note, required this.targetDate});

  @override
  _NewGoalScreenState createState() => _NewGoalScreenState();
}

class _NewGoalScreenState extends State<NewGoalScreen> {
  double _currentSliderValue = 0;
  bool _receiveAlerts = false;
  DateTime _selectedDate = DateTime.now();
  TextEditingController _amountController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  bool get _isNextButtonEnabled => _amountController.text.isNotEmpty && double.tryParse(_amountController.text) != null && double.tryParse(_amountController.text)! >= 0 && double.tryParse(_amountController.text)! <= 999999999999;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Goal'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'How much do you want to save for this goal?',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: "Enter amount (up to 999,999,999,999)"),
              keyboardType: TextInputType.numberWithOptions(decimal: false),
              onChanged: (value) => setState(() {}),
            ),
            Text(
              '\$${_amountController.text}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Achievement Date:'),
              subtitle: Text(DateFormat('dd MMM yyyy').format(_selectedDate)),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            SwitchListTile(
              title: Text('Receive Alerts'),
              subtitle: Text('We will notify you when you need to save for this goal.'),
              value: _receiveAlerts,
              onChanged: (bool value) {
                setState(() {
                  _receiveAlerts = value;
                });
              },
              activeColor: Colors.green,
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 250.0),
                child: ElevatedButton(
                  onPressed: _isNextButtonEnabled
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewGoal3(),
                      ),
                    );
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 140, vertical: 20),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
