
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/signup_page.dart';

import 'controllers/login_controller.dart';


class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
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
                  validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
                ),
                  
                const SizedBox(height: 12),
                  
                TextFormField(
                  controller: _loginController.passwordController,
                  obscureText: true,
                  decoration:const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
          
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
                  onPressed: (){
                    _loginController.signIn();
                    if(_formKey.currentState!.validate()){

                    }
                  },
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
                const SizedBox(height: 12),
                  
              const  Center(
                child: Text("Does not have an account?")),
                  
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                  
              ],
            ),
            ]
          ),
        ),
      ),
    );
  }
}
