import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final  formKey = GlobalKey<FormState>().obs;

  final RxBool isLoading = false.obs;
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
   
    RxBool agreed = false.obs;

  void toggleAgreement(bool value) {
    //Get.snackbar(title, message)
    agreed.value = value;
  }

  void selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2024),
    ))!;
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      dobController.text = picked.toString();
    }
  }

  Future<void> signup() async {
    if (agreed.value==true){
      if (formKey.value.currentState!.validate()) {
      isLoading.value = true;

      try {
        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        print(userCredential.user!.uid);
        // Signup successful
        Get.back(); // Navigate back to the previous screen
      } catch (error) {
        print(error.toString());
        // Handle signup error
        Get.snackbar('Error', error.toString());
      } finally {
        isLoading.value = false;
      }
    }
    }else{
      Get.snackbar("Please chick the checkbox", "fill the tearms and conduction");
    }
    
  }
}




// import 'package:get/get.dart';

// class TermsAndConditionsController extends GetxController {
//   RxBool agreed = false.obs;

//   void toggleAgreement(bool value) {
//     agreed.value = value;
//   }

// }




