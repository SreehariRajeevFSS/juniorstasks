import 'package:challenge/bmi/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiScreen extends StatelessWidget {
  final BmiController bmiController = Get.put(BmiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bmiController.bgColor.value,
        child: Center(
          child: Container(
            width: 300,
           // color: Colors.pink,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: bmiController.wtController,
                  decoration: InputDecoration(
                    labelText: 'Enter the Weight in KGS',
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: bmiController.fitController,
                  decoration: InputDecoration(
                    labelText: 'Enter the height in FEET',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: bmiController.inController,
                  decoration: InputDecoration(
                    labelText: 'Enter the Height in INCH',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    bmiController.calculateBMI();
                  },
                  child: Text('Calculate BMI'),
                ),
                SizedBox(height: 20),
                Obx(
                  () => Text(
                    bmiController.result.value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}