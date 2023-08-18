import 'package:challenge/homepage.dart';
import 'package:challenge/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>().obs;
  final isLoading = false.obs;
 final rememberMe = false.obs;
  Future<void> login() async {
    if (formKey.value.currentState!.validate()) {
      //isLoading.value = true;
      try {
        final userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        if (userCredential.user != null) {
          print(userCredential.user!.email);
          print('success');
          Get.off(() => HomePage());
          
          emailController.clear();
          passwordController.clear();
          //Get.offAllNamed('/home'); // Navigate to home page
        } else {}
      } catch (e) {
        print('error');
        Get.snackbar('error', 'invalid Password(or)email id');
      }
    }
  }

  // Future<void> sendVerificationEmail() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null && !user.emailVerified) {
  //     await user.sendEmailVerification();
  //   }
  // }

  void resetPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar('Email Required', 'Please enter your email');
      return;
    }

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      Get.snackbar('Password Reset', 'Password reset email sent');
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }
}
