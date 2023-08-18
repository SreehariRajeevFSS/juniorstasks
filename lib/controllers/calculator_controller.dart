import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxString result = ''.obs;

  void calculateBmi(double height, double weight) {
    double finalResult = weight / ((height / 100) * (height / 100));
    result.value = finalResult.toStringAsFixed(2);
  }
}
