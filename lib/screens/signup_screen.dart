import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';
import 'login_screen.dart';


class SignUpPage extends StatelessWidget {
  final SignUpController _signUpController = Get.put(SignUpController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null && picked != _signUpController.selectedDate.value) {
      _signUpController.selectedDate.value = picked;
      _signUpController.dobController.text =
          picked.toLocal().toString().split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Sign Up Page',
                      style: TextStyle(fontSize: 40, color: Colors.blue),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Create An Account ?',
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _signUpController.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _signUpController.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _signUpController.firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter First Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _signUpController.lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Last Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _signUpController.dobController,
                    readOnly: true,
                    onTap: () {
                      _selectDate(context);
                    },
                    decoration: const InputDecoration(
                      labelText: 'DOB',
                      prefixIcon: Icon(Icons.calendar_month),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select a valid date';
                      }

                      final dob = _signUpController.selectedDate.value;
                      final now = DateTime.now();
                      final age = now.year -
                          dob.year -
                          (now.month >= dob.month && now.day >= dob.day
                              ? 0
                              : 1);

                      if (age < 18) {
                        return 'You must be 18 years or older to sign up';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            value: _signUpController.agreeToTerms.value,
                            onChanged: (value) {
                              _signUpController.agreeToTerms.value = value!;
                            },
                          )),
                      const Text('Agree to terms & conditions'),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (_signUpController.agreeToTerms.value) {
                          try {
                            await _signUpController.signUp();

                            _signUpController.emailController.clear();
                            _signUpController.passwordController.clear();
                            _signUpController.firstNameController.clear();
                            _signUpController.lastNameController.clear();
                            _signUpController.dobController.clear();
                            _signUpController.agreeToTerms.value = false;

                            Get.to(() => LoginPage());
                          } catch (e) {
                            
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please agree to terms & conditions.',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(child: Text("Have You an account?")),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}











