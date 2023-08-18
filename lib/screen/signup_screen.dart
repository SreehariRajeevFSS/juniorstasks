import 'package:challenge/controller/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Obx(
          () => signupController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Center(
                  // Rest of your UI code remains the same
                  child: SingleChildScrollView(
                    child: Form(
                      key: signupController.formKey.value,
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text('Register',
                                  style: GoogleFonts.poppins(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff1A4F2F),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Create a new account',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15, color: Colors.grey[600])),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: signupController.firstnameController,
                                decoration: InputDecoration(
                                  //  labelText: 'Full Name',
                                  hintText: 'First Name',
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Full Name';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          //  ),
                          const SizedBox(
                            height: 10,
                          ),
                           TextFormField(
                                controller: signupController.lastnameController,
                                decoration: InputDecoration(
                                  //  labelText: 'Full Name',
                                  hintText: 'Last Name',
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Full Name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: signupController.emailController,
                            validator: (item) {
                              return item!.contains("@")
                                  ? null
                                  : "Enter valid Email";
                            },
                            onChanged: (item) {},
                            decoration: InputDecoration(
                              //  labelText: 'Email',
                              hintText: 'Email',
                              filled: true,

                              fillColor: Color(0xffE0E9E4),
                              hintStyle: const TextStyle(
                                  color: Color(0xff1A4F2F),
                                  fontWeight: FontWeight.bold),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xff1A4F2F),
                              ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: signupController.passwordController,
                            decoration: InputDecoration(
                              //  labelText: 'password',
                              hintText: 'Password',
                              filled: true,
                              fillColor: Color(0xffE0E9E4),
                              hintStyle: TextStyle(
                                  color: Color(0xff1A4F2F),
                                  fontWeight: FontWeight.bold),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xff1A4F2F),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password address';
                              }
                              if (!RegExp(
                                      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$')
                                  .hasMatch(value)) {
                                return 'Password must contain at least 1 capital letter, 1 lowercase letter, and 1 number, and be at least 6 characters long';
                              }
                              if (value.length < 6) {
                                return "enter the more than 6 letter ";
                              }
                              return null;
                            },
                            onChanged: (item) {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           TextFormField(
              controller: signupController.dobController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Date of Birth',
                filled: true,
                fillColor: Color(0xffE0E9E4),
                hintStyle: const TextStyle(
                    color: Color(0xff1A4F2F),
                    fontWeight: FontWeight.bold),
                prefixIcon: const Icon(
                  Icons.calendar_month,
                  color: Color(0xff1A4F2F),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Date Of Birth';
                                  }
                                  return null;
                                },
              onTap: () {
                signupController.selectDate(context);
              },
            ),
            const SizedBox(
              height: 30,
            ),

            CheckboxListTile(
            title: Text('Agree to terms & conditions,above 18+'),
            value: signupController.agreed.value,
            onChanged: (value) {
              signupController.toggleAgreement(value!);
            },
          ), 


                          
                          SizedBox(
                            height: 20,
                          ),

                          Container(
                              width: double.infinity,
                              //  decoration: BoxDecoration(),
                              child: ElevatedButton(
                                  onPressed: () {
                                    signupController.signup();
                                   
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff1A4F2F),
                                  ),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(color: Colors.white),
                                  )))
                        ],
                      ),
                          
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}



        








