import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CalculatorPage1 extends StatelessWidget {
  final CalculatorController _controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.40,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xFF12a644)),
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 60.0),
                  ),
                  Text(
                    "Calculator",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Obx(() => Text(
                            "${_controller.bmi}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 45.0),
                            textAlign: TextAlign.right,
                          )),
                    ),
                  ),
                  Obx(() => RichText(
                    text: TextSpan(
                        text: "Condition : ",
                        style: TextStyle(
                            color: Colors.white, fontSize: 25.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${_controller.condition}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.03,),
                  Text("Choose Data",
                      style: TextStyle(
                          color: Color(0xFF12a644),
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: size.height * 0.03,),
                  Obx(() =>  RichText(
                    text: TextSpan(
                        text: "Height : ",
                        style:
                            TextStyle(color: Color(0xFF403f3d), fontSize: 25.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${_controller.height.value} cm",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),),
                  SizedBox(height: size.height * 0.03,),
                  Obx(() => Slider(
                    value: _controller.height.value,
                    min: 0,
                    max: 250,
                    onChanged: (height) {
                      _controller.height.value = height;
                    },
                    divisions: 250,
                    label: "${_controller.height.value.toStringAsFixed(1)}",
                    activeColor: Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),),
                  SizedBox(height: size.height * 0.03,),
                  Obx(() => RichText(
                    text: TextSpan(
                        text: "Weight : ",
                        style:
                            TextStyle(color: Color(0xFF403f3d), fontSize: 25.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${_controller.weight.value} kg",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),),
                  SizedBox(height: size.height * 0.03,),
                  Obx(() =>  Slider(
                    value: _controller.weight.value,
                    min: 0,
                    max: 300,
                    onChanged: (weight) {
                      _controller.weight.value = weight;
                    },
                    divisions: 300,
                    label: "${_controller.weight.value.toStringAsFixed(1)}",
                    activeColor: Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),),
                  SizedBox(height: size.height * 0.03,),
                  Container(
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _controller.calculateBMI();
                        },
                        child: Text(
                          "Calculate",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF12a644),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
