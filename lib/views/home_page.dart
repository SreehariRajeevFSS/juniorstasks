import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/views/Login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: const Center(
            child: Text(
          "Login successfully",
          style: TextStyle(fontSize: 30, color: Colors.redAccent),
        )));
  }
}
