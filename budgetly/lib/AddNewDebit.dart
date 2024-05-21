import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewDebtPage extends StatefulWidget {
  @override
  _NewDebtPageState createState() => _NewDebtPageState();
}

class _NewDebtPageState extends State<NewDebtPage> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool isOwed = true; // true if money is owed by others to you

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Debts"),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: "Amount of debt",
                  prefixText: '\$ ',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("When will you pay it?"),
              subtitle: Text(DateFormat('dd MMM yyyy').format(selectedDate)),
              onTap: _selectDate,
            ),
            SwitchListTile(
              title: Text("Receive alerts"),
              subtitle: Text("We will notify you when you need to pay it"),
              value: isOwed,
              activeColor: Colors.green, // Change active color here
              onChanged: (bool value) {
                setState(() {
                  isOwed = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: noteController,
                decoration: InputDecoration(
                  labelText: "Note",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle save logic here
                },
                child: Text("Next"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  minimumSize: Size(200, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
