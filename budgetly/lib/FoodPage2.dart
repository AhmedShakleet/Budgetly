import 'package:budgetly/FoodPage.dart';
import 'package:budgetly/FoodPage3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Selection App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodSelectionScreen(),
    );
  }
}

class FoodSelectionScreen extends StatefulWidget {
  @override
  _FoodSelectionScreenState createState() => _FoodSelectionScreenState();
}

class _FoodSelectionScreenState extends State<FoodSelectionScreen> {
  List<String> allFoods = [
    'Chicken Molokhia',
    'Rabbit Molokhia',
    'Shrimp Molokhia',
    'Beef Molokhia',
    'Green Beans with Meat',
    'Green Beans with Garlic and Olive Oil',
    'Green Beans with Onion and Tomato',
    'Green Beans with Chicken',
    'White Beans with Tomato',
    'White Beans with Garlic and Olive Oil',
    'White Beans with Sausage',
    'White Beans with Beef',
    'Okra with Beef',
    'Okra with Chicken',
    'Okra with Olive Oil and Lemon',
    'Spinach with Minced Meat',
    'Spinach with Rice',
    'Pumpkin with Spinach and Coriander',
    'Roasted Pumpkin',
    'Pumpkin with Beef',
    'Pumpkin with Vegetables',
    'Fried Cauliflower',
    'Cauliflower with Bechamel Sauce and Minced Meat',
    'Cauliflower with Tomato Sauce',
    'Cauliflower with Tomato Sauce and Minced Meat',
    'Peas with Carrots and Meat',
    'Peas with Chicken',
    'Peas with Carrots, Potatoes, and Rice without Meat',
    'Potato and Meat Tajine',
    'Potatoes with Bechamel Sauce',
    'Stuffed Potatoes',
    'Potatoes with Chicken',
    'Potatoes with Quails',
    'Potatoes with Tripe',
    'Potatoes and Rice without Meat',
    'Zucchini with Bechamel Sauce',
    'Zucchini with Tomatoes and Onions',
    'Minced Meat Ratatouille',
    'Baba Ghanoush',
    'Eggplant with Vinegar and Garlic',
    'Eggplant and Meat Tajine',
    'Meatless Ratatouille',
    'Pasta with Bechamel Sauce and Minced Meat',
    'Pasta with Bechamel Sauce and Chicken',
    'Pasta with Bechamel Sauce and Vegetables',
    'Pasta with Bechamel Sauce and Shrimp',
    'Pasta with Red Sauce',
    'Pasta Primavera',
    'Pasta with Shrimp and Garlic',
    'Pasta with Shawarma',
    'Pasta with Tuna and Tomatoes',
    'Pasta with Béchamel',
    'Halal Kabab with Basmati Rice',
    'Grilled Kofta with Tahini Salad',
    'Chicken Kebab with Green Salad and Yogurt Sauce',
    'Kofta with Tahini Sauce and Fried Potatoes',
    'Meat Kebab with French Fries and Mixed Rice',
    'Chicken Kofta with Pasta in Red Sauce',
    'Koshari',
    'Lentil Soup',
    'Stuffed Zucchini, Eggplant, Pepper, and Potatoes',
    'Stuffed Cabbage',
    'Stuffed Cabbage with Chicken',
    'Stuffed Cabbage with Meat',
    'Stuffed Zucchini, Eggplant, Pepper, Tomatoes, and Potatoes with Chicken',
    'Stuffed Zucchini, Eggplant, Pepper, Tomatoes, and Potatoes with Meat',
    'Stuffed Grape Leaves',
    'Stuffed Grape Leaves with Chicken',
    'Grape Leaves with Meat',
    'Grilled Tilapia',
    'Fried Mullets',
    'Mixed Seafood',
    'Oven Grilled Fish',
    'Grilled Chicken',
    'Tuna with Cheese and Tomato',
    'Beans, Falafel, and Fried Potatoes',
    'Meat Fatta with Sauce',
    'Pastry with Ground Meat',
    'Alexandrian Liver with Pasta and Sauce',
    'Vegetable Soup',
    'Indomie with Chicken Schnitzel',
    'Hawawshi',
    'Feteer Meshaltet with Honey and Cheese',
    'Renga',
    'Stuffed Pigeon',
    'Loubia with Tomato without Meat',
    'Loubia with Tomato with Meat',
    'Sauteed Vegetables with Chicken',
    'Sauteed Vegetables without Chicken',
    'Cubed Potatoes with Onion',
    'Couscous',
    'Yellow Koshary',
    'Mbaqbaqa with Pasta',
    'Fake Pigeon',
    'Fried Eggs with Tomatoes and Onion',
    'Vegetable Omelet',
    'Shakshuka',
    'Egg Pancakes',
    'Cheese Egg Sandwich',
    'Scrambled Eggs with Sausage',
    'Hard-Boiled Egg with Salad',
    'Hard-Boiled Egg with Fava Beans',
    'Fluffy Omelet with Cheese',
    'Cottage Cheese Sandwich',
    'White Cheese with Olives',
    'Layered Pastry with Cheese',
    'Egyptian Bread with Cheese',
    'Domiati Cheese Sandwich with Tomato and Lettuce',
    'Rumi Cheese with Hard-Boiled Egg',
    'Feta Cheese Sandwich with Cucumber',
    'Cheese Stuffed Potato',
    'Cheese Croissant',
    'Cheese with Tomato and Pepper',
    'Cooked Fava Beans',
    '2 Fava Bean Sandwiches',
    '2 Falafel Sandwich',
    'Fava Beans with Egg',
    'Falafel with Egg',
    'Fava Beans with Olive Oil and Lemon',
    'Cheese Falafel',
    'Fava Beans with Tahini',
    'Fava Beans and Falafel',
    'Fava Beans with Sausage',
    'Fava Beans with Tomato Sauce and Onion',
    'Cheese and Thyme Crepe',
    'Yogurt with Mixed Fruits'
    // القائمة كاملة كما في السؤال السابق
  ];
  Set<String> favoriteFoods = Set();
  Set<String> hatedFoods = Set();

  void showSelectionDialog(bool isFavorite) {
    List<String> availableFoods = isFavorite
        ? allFoods.where((food) => !hatedFoods.contains(food)).toList()
        : allFoods.where((food) => !favoriteFoods.contains(food)).toList();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isFavorite ? 'Favorite Foods' : 'Hated Foods'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: availableFoods.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  title: Text(availableFoods[index]),
                  value: isFavorite
                      ? favoriteFoods.contains(availableFoods[index])
                      : hatedFoods.contains(availableFoods[index]),
                  onChanged: (bool? value) {
                    setState(() {
                      String food = availableFoods[index];
                      if (value!) {
                        isFavorite ? favoriteFoods.add(food) : hatedFoods.add(food);
                      } else {
                        isFavorite ? favoriteFoods.remove(food) : hatedFoods.remove(food);
                      }

                      // This ensures that the dialog remains open to allow further selections.
                      Navigator.pop(context);
                      showSelectionDialog(isFavorite);
                    });
                  },
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Done'),
              onPressed: () => Navigator.of(context). pop(),
            ),
          ],
        );
      },
    );
  }

  Widget buildSelectedList(Set<String> foods, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        Wrap(
          children: foods.map((food) {
            return Chip(
              label: Text(food),
              onDeleted: () {
                setState(() {
                  foods.remove(food);
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Selection'),
        backgroundColor: Colors.green, // تغيير لون الشريط العلوي
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 30), // زيادة المسافة العلوية
            ElevatedButton(
              child: Text('Select Favorite Foods', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // تغيير لون الزر
                minimumSize: Size(double.infinity, 50), // تغيير حجم الزر
              ),
              onPressed: () => showSelectionDialog(true),
            ),
            buildSelectedList(favoriteFoods, 'Your Favorite Foods'),
            SizedBox(height: 10), // زيادة المسافة بين الأزرار
            ElevatedButton(
              child: Text('Select Hated Foods', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // تغيير لون الزر
                minimumSize: Size(double.infinity, 50), // تغيير حجم الزر
              ),
              onPressed: () => showSelectionDialog(false),
            ),
            buildSelectedList(hatedFoods, 'Foods You Hate'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('You can choose the meals you love and the ones you hate',
                  textAlign: TextAlign.center),
            ),
            ElevatedButton(
              child: Text('Submit', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // تغيير لون الزر
                minimumSize: Size(double.infinity, 50), // تغيير حجم الزر
              ),
              onPressed: () {
                // Navigate to Diet Plan Screen when submit is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DietPlanScreen())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// DietPlanScreen from the provided code, unchanged.
