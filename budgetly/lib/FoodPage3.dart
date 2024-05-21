import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diet Plan App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DietPlanScreen(),
    );
  }
}

class DietPlanScreen extends StatefulWidget {
  @override
  _DietPlanScreenState createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
  final List<Map<String, dynamic>> weekMeals = List.generate(7, (int index) {
    return {
      'day': 'Day ${index + 1}',
      'meals': [
        {
          'meal': 'First Meal',
          'name': 'Oatmeal with Fruits',
          'ingredients': 'Oats, Banana, Apple, Milk',
          'calories': '350 kcal',
          'averagePrice': '10.00 SAR',
          'type': 'Breakfast'
        },
        {
          'meal': 'Second Meal',
          'name': 'Grilled Chicken Salad',
          'ingredients': 'Chicken, Lettuce, Tomatoes, Dressing',
          'calories': '300 kcal',
          'averagePrice': '15.00 SAR',
          'type': 'Lunch'
        },
        {
          'meal': 'Third Meal',
          'name': 'Yogurt with Nuts',
          'ingredients': 'Yogurt, Almonds, Honey',
          'calories': '220 kcal',
          'averagePrice': '12.00 SAR',
          'type': 'Snack'
        },
      ],
    };
  });

  void saveDietPlan() {
    // Implement saving functionality
    print("Diet plan saved.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Plan'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            for (var day in weekMeals)
              ExpansionTile(
                title: Text(
                  day['day'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                children: <Widget>[
                  for (var meal in day['meals'])
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${meal['meal']}: ${meal['name']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Change color to white
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('Ingredients: ${meal['ingredients']}', style: TextStyle(color: Colors.white)),
                              Text('Calories: ${meal['calories']}', style: TextStyle(color: Colors.white)),
                              Text('Average Price: ${meal['averagePrice']}', style: TextStyle(color: Colors.white)),
                              Text('Meal Type: ${meal['type']}', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: saveDietPlan,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text('Download Pdf', style: TextStyle(color: Colors.white)), // Change text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
