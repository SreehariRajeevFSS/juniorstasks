import 'package:get/get.dart';

// ignore: constant_identifier_names
enum MassCategory { Underweight, Normal, Overweight, Obese }

class CalculatorController extends GetxController {
  RxString result = ''.obs;
  Rx<MassCategory> massCategory = MassCategory.Normal.obs;

  void calculateBmi(double height, double weight) {
    double finalResult = weight / ((height / 100) * (height / 100));
    result.value = finalResult.toStringAsFixed(2);

    if (finalResult < 18.5) {
      massCategory.value = MassCategory.Underweight;
    } else if (finalResult < 24.9) {
      massCategory.value = MassCategory.Normal;
    } else if (finalResult < 29.9) {
      massCategory.value = MassCategory.Overweight;
    } else {
      massCategory.value = MassCategory.Obese;
    }
  }
}

