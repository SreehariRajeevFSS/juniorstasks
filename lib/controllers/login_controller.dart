import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/views/home_page.dart';
import 'package:test/views/signup_page.dart';

class LoginController extends GetxController {
  RxString email = "".obs;
  RxString password = "".obs;
  RxBool hidePassword = true.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  toggleHidePassword() {
    hidePassword.value = !hidePassword.value;
  }

  Future<void> login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        print('Logged in successfully: ${userCredential.user!.email}');

        Get.to(() => HomePage());
      } else {
        print('User is not registered');
      }
    } catch (e) {
      print('Error');
      Get.snackbar('error', 'invalid Password(or)email id',
          backgroundColor: Colors.lightGreen);
    }
  }
}
