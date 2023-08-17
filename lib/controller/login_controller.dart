
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>().obs;
  final isLoading = false.obs;

  Future<void> login() async {
    if (formKey.value.currentState!.validate()) {
      isLoading.value = true;

      try {
        final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        if (userCredential.user!.emailVerified) {
          Get.offAllNamed('/home'); // Navigate to home page
        } else {
          Get.snackbar('Verify Email', 'Verification link sent to your email');
          await sendVerificationEmail();
        }
      } catch (error) {
        Get.snackbar('Login Error', error.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> sendVerificationEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  void resetPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar('Email Required', 'Please enter your email');
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
      Get.snackbar('Password Reset', 'Password reset email sent');
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }
}





// import 'package:challenge/screen/login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthController extends GetxController {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();

//   void signUp() async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//       // You can save additional user details to Firebase Firestore here
//       Get.offAll(SiginScreen());
//     } catch (e) {
//       // Handle sign-up errors
//       print("Error during sign-up: $e");
//     }
//   }

// }
