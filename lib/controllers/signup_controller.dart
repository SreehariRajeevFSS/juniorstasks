import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  
  final Rx<DateTime> selectedDate = Rx<DateTime>(DateTime.now());
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  RxBool agreeToTerms = false.obs;

  Future<void> signUp() async {
    if (!agreeToTerms.value) {
      Get.dialog(
        AlertDialog(
          title:const Text('Sign Up Error'),
          content:const Text('Please agree to terms & conditions.'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child:const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offNamed('/login');
    } catch (e) {
      Get.dialog(
        AlertDialog(
          title:const Text('Sign Up Error'),
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
