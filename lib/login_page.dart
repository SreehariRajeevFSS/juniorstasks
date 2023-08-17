import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/login_controller.dart';


class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const  Center(
            child: Text(
              'Login Page',
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue
                ),
                ),
                ),
          const  Center(
            child: Text(
              'Welcome Back !',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red
                ),
                ),
                ),

            const  SizedBox(height: 15),

            TextFormField(
              controller: _loginController.emailController,
              decoration:const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _loginController.passwordController,
              obscureText: true,
              decoration:const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

          const  SizedBox(height: 12),

            TextButton(
              onPressed: _loginController.forgotPassword,
              child:const Center(
                child: Text(
                  'Forgot Password?',
                  ),
                  ),
            ),
            ElevatedButton(
              onPressed: _loginController.signIn,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child:const Center(
                child: Text(
                  'LogIn',
                  style: TextStyle(
                    color: Colors.white,
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
