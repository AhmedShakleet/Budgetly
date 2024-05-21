import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:budgetly/Password%20Reset%20Screen.dart';
import 'package:budgetly/Sign-Up%20Screen.dart';
import 'package:budgetly/Sign-in%20Successful%20Screen.dart';

class Login extends StatelessWidget {
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _rememberMe = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              image: AssetImage('images/logo3.png'),
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email or Phone Number',
                prefixIcon: Icon(Icons.email, color: Colors.green),
              ),
              onChanged: (value) => setState(() {}),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock, color: Colors.green),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              onChanged: (value) => setState(() {}),
            ),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                  activeColor: Colors.green,
                ),
                const Text('Remember me', style: TextStyle(color: Colors.green)),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PasswordResetScreen()),
                    );
                  },
                  child: const Text('Forgot Password?', style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: emailController.text.isNotEmpty && passwordController.text.isNotEmpty
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInSuccessfulScreen()),
                );
              }
                  : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) return Colors.grey;
                    return Colors.green; // Use the component's default.
                  },
                ),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 140, vertical: 20)),
              ),
              child: const Text('Sign In', style: TextStyle(color: Colors.white)),
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
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for Facebook login
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Facebook color
                    minimumSize: Size(44, 44),
                  ),
                  child: Icon(FontAwesomeIcons.facebookF, color: Colors.white),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for Google login
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Google color
                    minimumSize: Size(44, 44),
                  ),
                  child: Icon(FontAwesomeIcons.google, color: Colors.white),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for Apple login
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Apple color
                    minimumSize: Size(44, 44),
                  ),
                  child: Icon(FontAwesomeIcons.apple, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
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
                      style: TextStyle(color: Colors.green, decoration: TextDecoration.underline),
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
