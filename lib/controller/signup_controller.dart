import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

  Future<void> selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;

      dobController.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      DateTime dob = DateFormat('dd/MM/yyyy').parse(dobController.text);
      age = DateTime.now().year - dob.year;
      print('Select the date ${dobController.text}');
    }
  }

  int age = 0;
  Future<void> signup() async {
    if (age < 18) {
      //print('DOb is success ${dobController.text}');
      Get.snackbar('Error', 'U must be above 18');
    } else {
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
  }

  void toggleViewPassword() {
    viewPassword.value = !viewPassword.value;
  }
}
