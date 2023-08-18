import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final formKey = GlobalKey<FormState>().obs;
  final viewPassword = false.obs;
  final RxBool isLoading = false.obs;
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  RxBool agreed = false.obs;

  void toggleAgreement(bool value) {
    
    agreed.value = value;
  }

  void selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      dobController.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
    
  }

  Future<void> signup() async {
    if (agreed.value == true) {
      if (formKey.value.currentState!.validate()) {
        isLoading.value = true;

        try {
          final userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

          print(userCredential.user!.uid);

          Get.back();
        } catch (error) {
          print(error.toString());

          Get.snackbar('Error', error.toString());
        } finally {
          isLoading.value = false;
        }
      }
    } else {
      Get.snackbar(
          "Please check the checkbox", "Fill the tearms and conduction");
    }
  }
   void toggleViewPassword() {
    viewPassword.value = !viewPassword.value;
  }
}
