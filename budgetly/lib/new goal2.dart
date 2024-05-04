import 'package:budgetly/new%20goal3.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class newgoal2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Goal',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: NewGoalScreen(),
    );
  }
}

class NewGoalScreen extends StatefulWidget {
  @override
  _NewGoalScreenState createState() => _NewGoalScreenState();
}

class _NewGoalScreenState extends State<NewGoalScreen> {
  double _currentSliderValue = 4000;
  bool _receiveAlerts = false;
  DateTime _selectedDate = DateTime.now();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New goal'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'How much do you want to save for this goal',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 10000,
              divisions: 100,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
              activeColor: Colors.green, // Change slider color when active
            ),
            Text(
              '\$${_currentSliderValue.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Add Frequency buttons here
            // Add Date selection here
            ListTile(
              title: Text('When do you want to achieve your goal?'),
              subtitle: Text(DateFormat('dd MMM yyyy').format(_selectedDate)),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            SwitchListTile(
              title: Text('Receive alerts'),
              subtitle: Text('We will notify you when you need to save for this goal'),
              value: _receiveAlerts,
              onChanged: (bool value) {
                setState(() {
                  _receiveAlerts = value;
                });
              },
              activeColor: Colors.green, // Change switch color when active
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 250.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => newgoal3(),
                      ),
                    );// Handle next action
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
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