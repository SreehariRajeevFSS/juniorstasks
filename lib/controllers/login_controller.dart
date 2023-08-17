import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/views/home_page.dart';
import 'package:test/views/signup_page.dart';

class LoginController extends GetxController {
  RxString email = "".obs;
  RxString password = "".obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (e) {
      print('Error: $e');
    }
    Get.to(() => HomePage());
  }
}
