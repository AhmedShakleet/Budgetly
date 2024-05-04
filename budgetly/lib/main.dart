import 'package:budgetly/log%20in.dart';
import 'package:flutter/material.dart';
import 'package:budgetly/Password Reset Screen.dart';
import 'package:budgetly/Sign-Up Screen.dart';
import 'package:budgetly/Sign-in Successful Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'get started',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 350,
                child: Image(
                  alignment: Alignment.topCenter,
                  image: AssetImage('images/logo.png'),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                  );
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green.shade700),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min ,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                    SizedBox(width: 40,),
                    Icon(Icons.arrow_forward,
                        color: Colors.white), // Arrow icon
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
