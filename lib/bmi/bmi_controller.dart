import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiController extends GetxController {
  final wtController = TextEditingController();
  final fitController = TextEditingController();
  final inController = TextEditingController();
  final result = ''.obs;
  final bgColor = Rx<Color>(Colors.grey.shade200);

  void calculateBMI() {
    var wt = wtController.text.toString();
    var fit = fitController.text.toString();
    

    if (wt != '' && fit != '' ) {
      var iWt = int.parse(wt);
      var iFit = int.parse(fit);
      // var iInch = int.parse(inch);

      // var tInch = (iFit * 12) + iInch;

      // var tCm = tInch * 2.54;

      var tM = iFit / 100;

      var bmi = iWt / (tM * tM);

      var msg = '';

      if (bmi > 25) {
        msg = "You're overweight";
        bgColor.value = Colors.red.shade900;
      } else if (bmi < 18) {
        msg = "You're underweight";
        bgColor.value = Colors.yellow.shade500;
      } else {
        msg = "You're Healthy";
        bgColor.value = Colors.green.shade200;
      }

      result.value = '$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}';
    } else {
      result.value = 'Please fill all the required fields';
    }

    // Future.delayed(Duration(seconds: 2), () {
    //   result.value = '';
      
    // });
  }
}
