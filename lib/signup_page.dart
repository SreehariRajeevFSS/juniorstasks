import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/signup_controller.dart';


class SignUpPage extends StatelessWidget {

  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Sign Up Page',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue
                  ),
                  ),
                  ),
            const Center(
              child: Text(
                'Create An Account ?',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red
                  ),
                  ),
                  ),

            const SizedBox(height: 20,),

            TextFormField(
              controller: _signUpController.emailController,
              decoration:const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _signUpController.passwordController,
              obscureText: true,
              decoration:const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

          const SizedBox(height: 12),

            TextFormField(
              controller: _signUpController.firstNameController,
              decoration:const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _signUpController.lastNameController,
              decoration:const InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _signUpController.dobController,
              decoration:const InputDecoration(
                labelText: 'DOB',
                border: OutlineInputBorder(),
              ),
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
              const  Text('Agree to terms & conditions'),
              ],
            ),

            ElevatedButton(
              onPressed: _signUpController.signUp,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child:const Center(
                  child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
