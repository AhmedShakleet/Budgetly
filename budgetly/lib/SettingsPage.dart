import 'package:budgetly/ProfilePage.dart';
import 'package:budgetly/log%20in.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Edit Profile'),
                  leading: Icon(Icons.person, color: Colors.green),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Security'),
                  leading: Icon(Icons.security, color: Colors.green),
                  onTap: () {
                    // Implement navigation to Security settings screen
                  },
                ),
                ListTile(
                  title: Text('Notifications'),
                  leading: Icon(Icons.notifications, color: Colors.green),
                  onTap: () {
                    // Implement navigation to Notifications settings screen
                  },
                ),
                ListTile(
                  title: Text('Privacy'),
                  leading: Icon(Icons.privacy_tip, color: Colors.green),
                  onTap: () {
                    // Implement navigation to Privacy settings screen
                  },
                ),
                ListTile(
                  title: Text('Subscription'),
                  leading: Icon(Icons.payment, color: Colors.green),
                  onTap: () {
                    // Implement navigation to Subscription screen
                  },
                ),
                ListTile(
                  title: Text('Help and Support'),
                  leading: Icon(Icons.help, color: Colors.green),
                  onTap: () {
                    // Implement navigation to Help and Support screen
                  },
                ),
                ListTile(
                  title: Text('Why Budgetly'),
                  leading: Icon(Icons.question_answer, color: Colors.green),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Why Budgetly'),
                          content: Text('علشان الفقير        '),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  title: Text('Delete My Account'),
                  leading: Icon(Icons.delete_forever, color: Colors.red),
                  onTap: () {
                    // Implement navigation to Delete Account screen
                  },
                ),
                ListTile(
                  title: Text('Log Out'),
                  leading: Icon(Icons.exit_to_app, color: Colors.red),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
