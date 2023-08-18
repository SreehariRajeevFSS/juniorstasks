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
  RxBool agree = false.obs;

  void toogleAgreement(bool value) {
    agree.value = value;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  Future<void> signUp() async {
    if (!agree.value) {
      Get.snackbar("Terms Agreement", "Please agree to the terms.");
      return;
    }

    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        Get.off(() => LoginPage());
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
