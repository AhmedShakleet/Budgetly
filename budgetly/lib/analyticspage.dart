import 'package:flutter/material.dart';

class AnalyticsPage extends StatefulWidget {
  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  List<Map<String, dynamic>> customerPurchases = [
    {'name': 'John Doe', 'amount': 150.0, 'date': '2022-04-01'},
    {'name': 'Jane Smith', 'amount': 250.0, 'date': '2022-04-02'},
    {'name': 'Emily Johnson', 'amount': 400.0, 'date': '2022-04-03'},
  ];

  List<Map<String, dynamic>> dataMiningResults = [
    {'result': 'High Value Customers', 'count': 2},
    {'result': 'Churn Risk', 'count': 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Customer Purchases', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: customerPurchases.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${customerPurchases[index]['name']}'),
                  subtitle: Text('Amount: \$${customerPurchases[index]['amount']} on ${customerPurchases[index]['date']}'),
                );
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Data Mining Insights', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dataMiningResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${dataMiningResults[index]['result']}'),
                  subtitle: Text('Count: ${dataMiningResults[index]['count']}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
