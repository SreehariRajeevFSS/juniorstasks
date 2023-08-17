import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offNamed('/home');
    } catch (e) {
      Get.dialog(
        AlertDialog(
          title:const Text('Successful Login'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child:const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> forgotPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      Get.dialog(
        AlertDialog(
          title:const Text('Password Reset Email Sent'),
          content:const Text('Check your email for instructions to reset your password.'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child:const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      Get.dialog(
        AlertDialog(
          title:const Text('Password Reset Error'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child:const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}


