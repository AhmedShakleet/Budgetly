import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:budgetly/FoodPage2.dart'; // تأكد من صحة مسار الاستيراد هذا

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final TextEditingController _budgetController = TextEditingController();
  int? _familySize;
  int? _mealsPerDay;
  int? _mainMeals;
  int _lightMeals = 0;
  String? _dietDuration;

  bool get isSubmitButtonEnabled =>
      _budgetController.text.isNotEmpty &&
      _familySize != null &&
      _mealsPerDay != null &&
      _mainMeals != null &&
      _dietDuration != null;

  void updateLightMeals() {
    if (_mealsPerDay != null && _mainMeals != null) {
      _lightMeals = _mealsPerDay! - _mainMeals!;
      setState(() {});
    }
  }

  void navigateToFoodSelectionScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FoodSelectionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Planner'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _budgetController,
              decoration: InputDecoration(
                labelText: 'Budget for food',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (_) => setState(() {}),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<int>(
              value: _familySize,
              decoration: InputDecoration(
                labelText: 'Family Size (1-12)',
                border: OutlineInputBorder(),
              ),
              items: List.generate(12, (index) => index + 1)
                  .map((size) => DropdownMenuItem(
                        value: size,
                        child: Text('$size'),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _familySize = value;
                });
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<int>(
              value: _mealsPerDay,
              decoration: InputDecoration(
                labelText: 'Meals per Day (1-5)',
                border: OutlineInputBorder(),
              ),
              items: [1, 2, 3, 4, 5]
                  .map((number) => DropdownMenuItem(
                        value: number,
                        child: Text('$number'),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _mealsPerDay = value;
                  _mainMeals =
                      null; // Reset main meals if meals per day changes
                  updateLightMeals();
                });
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<int>(
              value: _mainMeals,
              decoration: InputDecoration(
                labelText: 'Number of Main Meals',
                border: OutlineInputBorder(),
              ),
              items: List.generate(_mealsPerDay ?? 0, (index) => index + 1)
                  .map((number) => DropdownMenuItem(
                        value: number,
                        child: Text('$number'),
                      ))
                  .toList(),
              onChanged: _mealsPerDay != null
                  ? (value) {
                      setState(() {
                        _mainMeals = value;
                        updateLightMeals();
                      });
                    }
                  : null,
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Number of Light Meals: $_lightMeals'),
              tileColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: Colors.grey.shade400),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _dietDuration,
              decoration: InputDecoration(
                labelText: 'Diet Duration',
                border: OutlineInputBorder(),
              ),
              items: ['1 Week', '10 Days', '1 Month']
                  .map((duration) => DropdownMenuItem(
                        value: duration,
                        child: Text(duration),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _dietDuration = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Submit', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isSubmitButtonEnabled ? Colors.green : Colors.grey,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed:
                  isSubmitButtonEnabled ? navigateToFoodSelectionScreen : null,
            ),
          ],
        ),
      ),
    );
  }
}
