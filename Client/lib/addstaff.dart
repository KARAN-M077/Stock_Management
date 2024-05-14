import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AddStaff extends StatefulWidget {
  const AddStaff({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddStaffState createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _staffIDController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  bool _isMale = false;
  bool _isFemale = false;

  Future<void> addstaff(name, staffID, age, gender, mobile) async {
    final dio = Dio();
    try {
      var bodyvalues = {
        "staffname": name,
        "staffID": staffID,
        "age": age,
        "gender": gender,
        "contact": mobile
      };

      final response = await dio.post(
          'https://consultancy-server.onrender.com/addstaff',
          data: bodyvalues);
      if (response.statusCode == 200) {
        // Show success message
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Staff added successfully!'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print('Error connecting to the server: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Staffs"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _staffIDController,
                  decoration: const InputDecoration(
                    labelText: 'Staff ID',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter StaffID';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter age';
                    }
                    // You can add age validation logic here
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Gender:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _isMale,
                      onChanged: (value) {
                        setState(() {
                          _isMale = value!;
                          if (value) {
                            _isFemale = false;
                          }
                        });
                      },
                    ),
                    const Text('Male'),
                    const SizedBox(width: 20),
                    Checkbox(
                      value: _isFemale,
                      onChanged: (value) {
                        setState(() {
                          _isFemale = value!;
                          if (value) {
                            _isMale = false;
                          }
                        });
                      },
                    ),
                    const Text('Female'),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _phonecontroller,
                  decoration: const InputDecoration(
                    labelText: 'Phone number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid phone number';
                    }
                    // You can add age validation logic here
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String name = _nameController.text;
                      String age = _ageController.text;
                      String staffID = _staffIDController.text;
                      String gender =
                          _isMale ? 'Male' : (_isFemale ? 'Female' : '');
                      String mobile = _phonecontroller.text;
                      addstaff(name, staffID, age, gender, mobile);
                    }
                  },
                  child: const Text('Add Staff'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}
