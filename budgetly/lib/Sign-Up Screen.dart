import 'package:flutter/material.dart';
import 'package:budgetly/verify%20your%20email.dart'; // Ensure this import path is correct.

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;
  bool _formValid = false;
  bool _isPasswordCompliant = false;
  Map<String, bool> passwordCriteria = {
    'Minimum 8 characters': false,
    'Includes an uppercase letter': false,
    'Includes a lowercase letter': false,
    'Includes a number': false,
  };

  @override
  void initState() {
    super.initState();
    firstNameController.addListener(_validateForm);
    lastNameController.addListener(_validateForm);
    emailOrPhoneController.addListener(_validateForm);
    passwordController.addListener(_validatePassword);
    confirmPasswordController.addListener(_validateForm);
  }

  void _validatePassword() {
    String pass = passwordController.text;
    passwordCriteria['Minimum 8 characters'] = pass.length >= 8;
    passwordCriteria['Includes an uppercase letter'] = pass.contains(RegExp(r'[A-Z]'));
    passwordCriteria['Includes a lowercase letter'] = pass.contains(RegExp(r'[a-z]'));
    passwordCriteria['Includes a number'] = pass.contains(RegExp(r'[0-9]'));

    bool isCompliant = passwordCriteria.values.every((element) => element);
    setState(() {
      _isPasswordCompliant = isCompliant;
      _validateForm();
    });
  }

  void _validateForm() {
    bool valid = firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailOrPhoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        confirmPasswordController.text == passwordController.text &&
        _isPasswordCompliant;
    setState(() {
      _formValid = valid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Sign Up", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              'Create Your Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create account for exploring news',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Image.asset(
              'images/logo3.png', // Make sure to have this asset in your project
              height: 100,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      prefixIcon: Icon(Icons.person, color: Colors.green),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      prefixIcon: Icon(Icons.person, color: Colors.green),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: emailOrPhoneController,
                    decoration: InputDecoration(
                      labelText: 'Email or Phone Number',
                      prefixIcon: Icon(Icons.email, color: Colors.green),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    obscureText: _obscureTextPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock, color: Colors.green),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureTextPassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureTextPassword = !_obscureTextPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  _buildPasswordCriteria(),  // Password criteria displayed below the password field.
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: _obscureTextConfirmPassword,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock, color: Colors.green),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureTextConfirmPassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
                          });
                        },
                      ),
                      errorText: confirmPasswordController.text != passwordController.text ? 'Passwords must match' : null,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _formValid ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VerifyYourEmail()),
                      );
                    } : null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return states.contains(MaterialState.disabled) ? Colors.grey : Colors.green;
                        },
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordCriteria() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: passwordCriteria.keys.map((key) {
        return Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                passwordCriteria[key]! ? Icons.check : Icons.close,
                color: passwordCriteria[key]! ? Colors.green : Colors.red,
              ),
              SizedBox(width: 10),
              Text(key, style: TextStyle(color: passwordCriteria[key]! ? Colors.green : Colors.red)),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailOrPhoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
