import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/views/Login_page.dart';

import '../controllers/signup_controller.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
              controller: signupController.emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: signupController.passwordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: signupController.firstNameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'First Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: signupController.lastNameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: signupController.dobController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_month),
                  labelText: 'DOB',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
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
                        signupController.agreed(value!);
                      }),
                ),
                const Text(
                  'I agree to terms & conditions',
                  style: TextStyle(fontSize: 18),
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
                  Get.to(() => LoginPage());
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(
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
    ));
  }
}
