import 'package:budgetly/Password%20Reset%20Screen.dart';
import 'package:budgetly/Sign-Up%20Screen.dart';
import 'package:budgetly/Sign-in%20Successful%20Screen.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome Back!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 8),
            const Text(
              "Let's Login For Explore Continues",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            const Image(
              image: AssetImage('images/logo3.png'), // Add your logo image
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email or Phone Number',
                prefixIcon: Icon(Icons.email, color: Colors.green), // Add email icon
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email or phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock, color: Colors.green), // Add lock icon
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}), // Add checkbox
                const Text('Remember me',
                    style: TextStyle(color: Colors.green)),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PasswordResetScreen()),
                    );
                  },
                  child: const Text('Forgot Password?',
                      style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to sign in successful screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignInSuccessfulScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 140, vertical: 20)),
              ),
              child:
              const Text('Sign In', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 24),
            const Text(
              'You can connect with',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  width: 44,
                  height: 44,
                  child:
                  Image.asset('images/facebook.png', width: 44, height: 44),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 14, 0),
                  width: 44,
                  height: 44,
                  child:
                  Image.asset('images/google.png', width: 44, height: 44),
                ),
                Container(
                  width: 36,
                  height: 42,
                  child:
                  Image.asset('images/apple.png', width: 36, height: 42),
                ),
              ],
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                // Navigate to sign up screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.blue),
                  children: [
                    TextSpan(
                      text: "Sign up here",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}