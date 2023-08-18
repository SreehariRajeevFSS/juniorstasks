import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/views/Login_page.dart';

import '../controllers/signup_controller.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView(children: [
          Column(
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Create an account?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: signupController.emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter the Email address';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: signupController.passwordController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.visibility),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter the Password';
                  }
                  if (value.trim().length < 8) {
                    return 'Password must be at least 8 characters in length';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: signupController.firstNameController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'First Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter the FirstName';
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: signupController.lastNameController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Last Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter the lastName';
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                readOnly: true,
                controller: signupController.dobController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_month),
                ),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2024),
                  );

                  if (selectedDate != null) {
                    signupController.dobController.text =
                        selectedDate.toLocal().toString().split(' ')[0];
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Checkbox(
                        value: signupController.agree.value,
                        onChanged: (value) {
                          signupController.agree.value = value!;
                        }),
                  ),
                  const Text(
                    'I agree to terms&conditions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    signupController.signUp();
                    if (_formKey.currentState!.validate()) {
                      signupController.emailController.clear();
                      signupController.passwordController.clear();
                      signupController.firstNameController.clear();
                      signupController.lastNameController.clear();
                      signupController.dobController.clear();
                      Get.to(() => LoginPage());
                    }
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have account ?",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LoginPage());
                    },
                    child: const Text(
                      "Sign In ",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                  )
                ],
              )
            ],
          ),
        ]),
      ),
    ));
  }
}
