import 'package:flutter/material.dart';
class SignupSuccessfulScreen extends StatelessWidget {
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
                  image: AssetImage('images/yay.png'), // Your photo asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Text
          Text(
            'Yay! Sign up successful',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'You will be moved to the home screen right now.\nEnjoy the features!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey  ,
            ),
          ),
          const SizedBox(height: 20),
          // Button at the bottom center
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen or perform an action
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                  ),
                ),
                child: const Text(
                  "Let's Explore",
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