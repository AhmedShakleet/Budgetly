import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'new goal2.dart';

class NewGoal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Goal',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: NewGoalPage(),
    );
  }
}

class NewGoalPage extends StatefulWidget {
  @override
  _NewGoalPageState createState() => _NewGoalPageState();
}

class _NewGoalPageState extends State<NewGoalPage> {
  final TextEditingController _goalNameController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime? selectedDate;
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  void dispose() {
    _goalNameController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  bool get _isNextButtonEnabled {
    return _goalNameController.text.isNotEmpty && selectedDate != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('New Goal'),
        backgroundColor: Colors.green, // Set the color to green
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green,
                backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
                child: _image == null ? Icon(Icons.camera_alt, color: Colors.white) : null,
              ),
            ),
            TextField(
              controller: _goalNameController,
              decoration: InputDecoration(labelText: 'Goal Name'),
              onChanged: (value) => setState(() {}),
            ),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(labelText: 'Note'),
              maxLines: 3,
            ),
            ListTile(
              title: Text('Start Date:'),
              subtitle: Text(selectedDate != null ? DateFormat('dd MMM yyyy').format(selectedDate!) : 'No date selected'),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isNextButtonEnabled
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewGoal2(
                      goalName: _goalNameController.text,
                      note: _noteController.text,
                      targetDate: selectedDate!,
                    ),
                  ),
                );
              }
                  : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey; // Disabled color
                    }
                    return Colors.green; // Default color when enabled
                  },
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                ),
              ),
              child: Text(
                "Next",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
