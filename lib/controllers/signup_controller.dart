import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test/views/Login_page.dart';

class SignupController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString dob = ''.obs;
  RxBool agreedToTerms = false.obs;
  RxBool isAbove18 = false.obs;
  RxBool hiddenPassword = true.obs;

  void toogleAgreement(bool value) {
    agreedToTerms.value = value;
  }

  toggleHiddenPassword() {
    hiddenPassword.value = !hiddenPassword.value;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  Future<void> signUp() async {
    if (!agreedToTerms.value) {
      Get.snackbar("Terms Agreement", "Please agree to the terms.");
      return;
    }

    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        Get.back();
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        Get.snackbar(
          "Sign Up Error",
          e.message ?? "An error occurred during sign up.",
          backgroundColor: Colors.blue,
        );
      }
    }
  }
}
