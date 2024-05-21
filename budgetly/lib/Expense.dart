import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: AddExpensePage(),
  ));
}

class ExpenseItem {
  String name;
  String category;
  double amount;
  DateTime date;
  String? notes;

  ExpenseItem({
    required this.name,
    required this.category,
    required this.amount,
    required this.date,
    this.notes,
  });
}

class AddExpensePage extends StatefulWidget {
  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _notesController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String? _selectedCategory;
  List<ExpenseItem> _expenses = [];

  List<String> _categories = [
    'Vegetables and Fruits', 'Meat and Fish', 'Basic Groceries (like rice and pasta)',
    'Dairy and Eggs', 'Fast Food', 'Beverages (Coffee, Tea, Juices)',
    'Sweets and Baked Goods', 'Cleaning and Laundry Products',
    'Personal Care (like shampoo and toothpaste)', 'Clothing and Shoes',
    'Electronics and Appliances', 'Furniture and Home Decor',
    'Kitchen Tools and Utensils', 'Toys and Entertainment',
    'Books and Magazines', 'Education and Courses',
    'Transportation', 'Pharmacy and Medical Supplies',
    'Gifts and Occasions', 'Donations and Aids'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new expense'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _buildInputFields(),
            _buildExpenseList(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputFields() {
    return Column(
      children: <Widget>[
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: 'Name of the Item',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.text_fields),
          ),
          onChanged: (value) => setState(() {}),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _amountController,
          decoration: InputDecoration(
            labelText: 'Amount (\$)',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.attach_money),
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) => setState(() {}),
        ),
        ListTile(
          leading: Icon(Icons.calendar_today, color: Colors.green),
          title: Text('Date: ${DateFormat('dd MMM yyyy, HH:mm').format(_selectedDate)}'),
          onTap: _selectDate,
        ),
        ListTile(
          leading: Icon(Icons.category, color: Colors.green),
          title: Text(_selectedCategory ?? 'Select category'),
          onTap: _selectCategory,
        ),
        TextField(
          controller: _notesController,
          decoration: InputDecoration(
            labelText: 'Add notes',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.note_add),
          ),
          maxLines: 3,
          onChanged: (value) => setState(() {}),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _nameController.text.isNotEmpty && _amountController.text.isNotEmpty && _selectedCategory != null ? _addExpense : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              return states.contains(MaterialState.disabled) ? Colors.grey : Colors.green;
            }),
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 120, vertical: 20)),
          ),
          child: Text('Save', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  void _addExpense() {
    if (_nameController.text.isNotEmpty && _amountController.text.isNotEmpty && _selectedCategory != null) {
      setState(() {
        _expenses.add(ExpenseItem(
          name: _nameController.text,
          category: _selectedCategory!,
          amount: double.parse(_amountController.text),
          date: _selectedDate,
          notes: _notesController.text.isEmpty ? null : _notesController.text,
        ));
        _nameController.clear();
        _amountController.clear();
        _notesController.clear();
        _selectedCategory = null;
      });
    }
  }

  Widget _buildExpenseList() {
    return Column(
      children: _expenses.map((expense) => _buildExpenseItem(expense)).toList(),
    );
  }

  Widget _buildExpenseItem(ExpenseItem expense) {
    return Card(
      child: ListTile(
        title: Text("${expense.name} - \$${expense.amount.toStringAsFixed(2)}"),
        subtitle: Text("${expense.category} - ${DateFormat('dd MMM yyyy').format(expense.date)}${expense.notes != null ? ' - Notes: ${expense.notes}' : ''}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Handle edit
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _expenses.remove(expense);
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.copy),
              onPressed: () {
                setState(() {
                  _expenses.add(ExpenseItem(
                    name: expense.name,
                    category: expense.category,
                    amount: expense.amount,
                    date: expense.date,
                    notes: expense.notes,
                  ));
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _selectCategory() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: ListView.builder(
            itemCount: _categories.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_categories[index]),
                onTap: () {
                  setState(() {
                    _selectedCategory = _categories[index];
                    Navigator.pop(context);
                  });
                },
              );
            },
          ),
        );
      },
    );
  }
}
