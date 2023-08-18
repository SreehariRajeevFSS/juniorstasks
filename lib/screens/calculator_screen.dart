import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/calculator_controller.dart';

class CalculatorScreen extends StatelessWidget {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "BMI Calculator App",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Your Height in cm :",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Your height in cm',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Your Weight in kg :",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Your Weight in kg', // Corrected the hint text
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  double height = double.parse(heightController.text);
                  double weight = double.parse(weightController.text);
                  Get.find<CalculatorController>().calculateBmi(height, weight);
                  weightController.clear();
                  heightController.clear();
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GetX<CalculatorController>(
              init: CalculatorController(),
              builder: (controller) {
                String bmiResult = controller.result.value;
                String massCategory =
                    controller.massCategory.value.toString().split('.').last;

                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Your BMI is : $bmiResult",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.pink,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Category: $massCategory",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
