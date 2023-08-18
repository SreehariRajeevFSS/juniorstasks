import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test/views/home_page.dart';
import 'package:test/views/signup_page.dart';

import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: ListView(
            children: [
              Column(
                children: const [
                  Text(
                    "Login Page",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: loginController.emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: loginController.passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                onPressed: () {
                  loginController.login();
                  if (_formKey.currentState!.validate()) {
                    loginController.emailController.clear();
                    loginController.passwordController.clear();
                    Get.to(() => HomePage());
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Does not have an account?",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignupPage());
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
