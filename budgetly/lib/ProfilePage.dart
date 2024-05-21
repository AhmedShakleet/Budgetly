import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart'; // Import for FilteringTextInputFormatter
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:currency_picker/currency_picker.dart';

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController(); // Phone controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  Country? _selectedCountry;
  Currency? _selectedCurrency;
  XFile? _image;
  bool isDataEntered = false;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      _checkDataEntered();
    });
  }

  void _checkDataEntered() {
    bool dataEntered = _selectedCountry != null || _selectedCurrency != null ||
        phoneController.text.isNotEmpty || dateController.text.isNotEmpty ||
        nameController.text.isNotEmpty || emailController.text.isNotEmpty;
    setState(() {
      isDataEntered = dataEntered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: _image != null ? FileImage(File(_image!.path)) : AssetImage("assets/default_avatar.png") as ImageProvider,
                backgroundColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 30),
            buildTextField('Name', 'Enter your name', false, nameController, Icons.person),
            const SizedBox(height: 10),
            buildTextField('Email', 'Enter your email', false, emailController, Icons.email),
            const SizedBox(height: 10),
            buildTextField('Phone Number', 'Enter your phone number', false, phoneController, Icons.phone, TextInputType.phone),
            const SizedBox(height: 10),
            buildTextFieldDate('Date of Birth', dateController, Icons.calendar_today),
            const SizedBox(height: 10),
            buildCountryPicker(),
            const SizedBox(height: 10),
            buildCurrencyPicker(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isDataEntered ? () {
                // Save changes
              } : null,
              child: Text('Save changes', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: isDataEntered ? Colors.green : Colors.grey,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String placeholder, bool isPassword, TextEditingController controller, IconData icon, [TextInputType keyboardType = TextInputType.text]) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
        border: OutlineInputBorder(),
        suffixIcon: icon != null ? Icon(icon) : null,
      ),
      keyboardType: keyboardType,
      inputFormatters: keyboardType == TextInputType.phone ? [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
      ] : null,
      obscureText: isPassword,
      onChanged: (value) => _checkDataEntered(),
    );
  }

  Widget buildTextFieldDate(String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        suffixIcon: Icon(icon),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          controller.text = DateFormat('dd/MM/yyyy').format(picked);
          _checkDataEntered();
        }
      },
    );
  }

  Widget buildCountryPicker() {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Select Country',
        border: OutlineInputBorder(),
      ),
      child: ListTile(
        title: Text(_selectedCountry?.name ?? 'No country selected'),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: () {
          showCountryPicker(
            context: context,
            onSelect: (Country country) {
              setState(() {
                _selectedCountry = country;
                _checkDataEntered();
              });
            },
          );
        },
      ),
    );
  }

  Widget buildCurrencyPicker() {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Select Currency',
        border: OutlineInputBorder(),
      ),
      child: ListTile(
        title: Text(_selectedCurrency?.name ?? 'No currency selected'),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: () {
          showCurrencyPicker(
            context: context,
            showFlag: true,
            showCurrencyName: true,
            onSelect: (Currency currency) {
              setState(() {
                _selectedCurrency = currency;
                _checkDataEntered();
              });
            },
          );
        },
      ),
    );
  }
}
