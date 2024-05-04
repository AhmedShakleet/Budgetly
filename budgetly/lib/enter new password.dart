import 'package:budgetly/Sign-up%20Successful%20Screen.dart';
import 'package:flutter/material.dart';
class enternewpassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Photo in the center
          Center(
            child: Container(
              width: 340,
              height: 340,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('images/new password.png'), // Your photo asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Text
          Text(
            'Enter New Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Set Complex passwords to protect',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          // Email address field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter Your Password',
                    prefixIcon: Icon(Icons.lock, color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Another field similar to Enter Verification Code
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'ReEnter Your Password',
                    prefixIcon: Icon(Icons.lock, color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Button at the bottom center
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  ),
                ),
                child: const Text(
                  "Verify and Set New Password",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}