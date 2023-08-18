import 'package:challenge/controller/login_controller.dart';
import 'package:challenge/homepage.dart';
import 'package:challenge/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>
         Form(
          key: loginController.formKey.value,
          child: Padding(
            
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.network(
                        'https://cms-assets.tutsplus.com/uploads/users/343/posts/23627/preview_image/tutsplus-icon.png'),
                  ),
                  const Center(
                    child: Text(
                      'LOGIN PAGE',
                      style: TextStyle(
                          color: Color(0xff1A4F2F),
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Login To Your Account ',
                    style: TextStyle(
                        color: Color(0xffA8A8A8),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 90),
                    child: TextFormField(
                      controller: loginController.emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Color(0xffE0E9E4),
                        hintStyle: TextStyle(
                            color: Color(0xff1A4F2F),
                            fontWeight: FontWeight.bold),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xff1A4F2F),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      validator: (item) {
                        return item!.contains("@") ? null : "Enter valid Email";
                      },
                      onChanged: (item) {},
                    ),
                  ),
                  TextFormField(
                    obscureText: !loginController.showPassword.value,
                    controller: loginController.passwordController,
                    decoration: InputDecoration(
                     
                      hintText: 'Password',
                      filled: true,
                      fillColor: Color(0xffE0E9E4),
                      hintStyle: TextStyle(
                          color: Color(0xff1A4F2F), fontWeight: FontWeight.bold),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xff1A4F2F),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    
                     suffixIcon: IconButton(
                    icon: loginController.showPassword.value
                        ? Icon(Icons.visibility)
                        // : Text(
                        //     'SHOW',
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                     : Icon(Icons.visibility_off),
                    onPressed: loginController.toggleShowPassword,
                  ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Checkbox(
        value: loginController.rememberMe.value,
        onChanged: (newValue) {
          loginController.rememberMe.value = newValue!;
        },
          ),
                       //  Icon(Icons.check_box_sharp),
      
                      Text(
                        'Remember Me',
                        style: TextStyle(
                            color: Color(0xffA8A8A8),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                       //  Icon(Icons.check_box_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: 
                         loginController.resetPassword,
                        
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xff1A4F2F),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
      
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                           
                            loginController.login();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff1A4F2F),
                          ),
                          child: const Text(
                            'LogIn',
                            style: TextStyle(color: Colors.white),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Dont have an account?',
                        style: TextStyle(
                            color: Color(0xffA3A3A3),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(()=>SignupScreen());
                          
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              color: Color(0xff1A4F2F),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
         
        ),
      ),
    );
  }
}















