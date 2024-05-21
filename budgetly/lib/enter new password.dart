import 'package:flutter/material.dart';
import 'package:budgetly/Sign-in%20Successful%20Screen.dart';

class EnterNewPassword extends StatefulWidget {
  @override
  _EnterNewPasswordState createState() => _EnterNewPasswordState();
}

class _EnterNewPasswordState extends State<EnterNewPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isPasswordMatch = false;
  bool hasMinLength = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasNumber = false;

  void checkPassword(String password) {
    setState(() {
      hasMinLength = password.length >= 8;
      hasUpperCase = password.contains(RegExp(r'[A-Z]'));
      hasLowerCase = password.contains(RegExp(r'[a-z]'));
      hasNumber = password.contains(RegExp(r'[0-9]'));
      isPasswordMatch = confirmPasswordController.text == password;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFormValid = isPasswordMatch && hasMinLength && hasUpperCase && hasLowerCase && hasNumber;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 340,
                height: 340,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/new password.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Enter Your Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.green),
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
                onChanged: (value) {
                  checkPassword(value);
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: confirmPasswordController,
                obscureText: !isConfirmPasswordVisible,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: 'ReEnter Your Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.green),
                  suffixIcon: IconButton(
                    icon: Icon(isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordVisible = !isConfirmPasswordVisible;
                      });
                    },
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    isPasswordMatch = passwordController.text == value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) return null;
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),
            PasswordRequirements(
              hasMinLength: hasMinLength,
              hasUpperCase: hasUpperCase,
              hasLowerCase: hasLowerCase,
              hasNumber: hasNumber,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: isFormValid ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInSuccessfulScreen()),
                    );
                  } : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey; // Disabled color
                        }
                        return Colors.green; // Default color when enabled
                      },
                    ),
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
      ),
    );
  }
}

class PasswordRequirements extends StatelessWidget {
  final bool hasMinLength;
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasNumber;

  const PasswordRequirements({
    Key? key,
    required this.hasMinLength,
    required this.hasUpperCase,
    required this.hasLowerCase,
    required this.hasNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PasswordRequirement(text: "At least 8 characters", isValid: hasMinLength),
          PasswordRequirement(text: "Includes an uppercase letter", isValid: hasUpperCase),
          PasswordRequirement(text: "Includes a lowercase letter", isValid: hasLowerCase),
          PasswordRequirement(text: "Includes a number", isValid: hasNumber),
        ],
      ),
    );
  }
}

class PasswordRequirement extends StatelessWidget {
  final String text;
  final bool isValid;

  const PasswordRequirement({
    Key? key,
    required this.text,
    required this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.error,
          color: isValid ? Colors.green : Colors.red,
        ),
        SizedBox(width: 10),
        Text(text),
      ],
    );
  }
}
