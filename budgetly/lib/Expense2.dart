import 'package:budgetly/Expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ExpenseReportPage extends StatefulWidget {
  final List<ExpenseItem> expenses;

  ExpenseReportPage({required this.expenses});

  @override
  _ExpenseReportPageState createState() => _ExpenseReportPageState();
}

class _ExpenseReportPageState extends State<ExpenseReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Report'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Amount')),
              DataColumn(label: Text('Category')),
              DataColumn(label: Text('Notes')),
            ],
            rows: widget.expenses.map((expense) => DataRow(
              cells: <DataCell>[
                DataCell(Text(widget.expenses.indexOf(expense).toString())),
                DataCell(Text(DateFormat('dd MMM yyyy').format(expense.date))),
                DataCell(Text(expense.name)),
                DataCell(Text('\$${expense.amount.toStringAsFixed(2)}')),
                DataCell(Text(expense.category)),
                DataCell(Text(expense.notes ?? '')),
              ],
            )).toList(),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              child: Text('Download as Excel'),
              onPressed: _createExcel,
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  void _createExcel() async {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];
    List<String> headers = ["ID", "Date", "Name", "Amount", "Category", "Notes"];

    sheetObject.appendRow(headers);
    for (var expense in widget.expenses) {
      List<dynamic> row = [
        widget.expenses.indexOf(expense),
        DateFormat('dd MMM yyyy').format(expense.date),
        expense.name,
        '\$${expense.amount.toStringAsFixed(2)}',
        expense.category,
        expense.notes ?? ''
      ];
      sheetObject.appendRow(row);
    }

    var fileBytes = excel.save();
    var directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/expenses.xlsx';
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Excel file created at $filePath')),
    );
  }
}
