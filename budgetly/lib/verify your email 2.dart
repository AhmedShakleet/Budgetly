import 'package:budgetly/enter%20new%20password.dart';
import 'package:flutter/material.dart';
import 'package:budgetly/Sign-up%20Successful%20Screen.dart';

class VerifyYourEmail2 extends StatefulWidget {
  @override
  _VerifyYourEmailState createState() => _VerifyYourEmailState();
}

class _VerifyYourEmailState extends State<VerifyYourEmail2> {
  List<TextEditingController> controllers = List.generate(6, (index) => TextEditingController());
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Verify Your Email"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Center(
              child: Container(
                width: 340,
                height: 340,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/verify.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Confirm Your Email',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'We have sent a 6-digit verification code to',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) => _otpTextField(index)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controllers.every((controller) => controller.text.length == 1 && controller.text.contains(RegExp(r'^[0-9]$')))
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EnterNewPassword()),
                );
              }
                  : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return states.contains(MaterialState.disabled) ? Colors.grey : Colors.green;
                  },
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                ),
              ),
              child: const Text(
                "Verify and Create Account",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpTextField(int index) {
    return SizedBox(
      width: 40,
      child: TextField(
        controller: controllers[index],
        focusNode: index == 0 ? focusNode : null,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.green),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1 && index < 5) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
          setState(() {});
        },
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    focusNode.dispose();
    super.dispose();
  }
}
