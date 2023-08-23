import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxDouble height = 175.0.obs;
  RxDouble weight = 75.0.obs;
  RxInt bmi = 0.obs;
  RxString condition = 'Select Data'.obs;

  void calculateBMI() {
    bmi.value = (weight.value / ((height.value / 100) * (height.value / 100))).round().toInt();
    if (bmi.value >= 18.5 && bmi.value <= 25) {
      condition.value = "Normal";
    } else if (bmi.value > 25 && bmi.value <= 30) {
      condition.value = "Overweight";
    } else if (bmi.value > 30) {
      condition.value = "Obesity";
    } else {
      condition.value = "Underweight";
    }
  }
}
