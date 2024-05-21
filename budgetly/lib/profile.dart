import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:country_picker/country_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:currency_picker/currency_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: EditProfilePage(),
  ));
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Country? _selectedCountry;
  Currency? _selectedCurrency;
  bool _passwordVisible = false;
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
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
            buildTextField('Name', 'Enter your name', false),
            buildTextField('Email', 'Enter your email', false),
            buildTextField('Password', 'Enter your password', true),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(), // تقييد التاريخ ليشمل اليوم فقط
                );
                if (picked != null) {
                  dateController.text = DateFormat('dd/MM/yyyy').format(picked);
                }
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(_selectedCountry?.name ?? 'No country selected'),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                showCountryPicker(
                  context: context,
                  onSelect: (Country country) {
                    setState(() {
                      _selectedCountry = country;
                    });
                  },
                );
              },
            ),
            ListTile(
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
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save changes
              },
              child: Text('Save changes'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String placeholder, bool isPassword) {
    return TextField(
      controller: isPassword ? passwordController : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
        border: OutlineInputBorder(),
        suffixIcon: isPassword ? IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ) : null,
      ),
      obscureText: isPassword ? !_passwordVisible : false,
    );
  }
}
