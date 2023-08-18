import 'package:challenge/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login successful',style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold),
              
              ),
              ElevatedButton(
                onPressed: (){
             Get.to(()=>LoginPage());
            }, child: Text('Sign out'))
            ],
          ),
        ),
          
          
          
    );
  }
}