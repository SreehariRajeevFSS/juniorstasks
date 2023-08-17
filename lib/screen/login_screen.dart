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
      body: Form(
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
                    Text(
                      'Remember Me',
                      style: TextStyle(
                          color: Color(0xffA8A8A8),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    //   Icon(Icons.check_box_sharp),
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

                    // Text(
                    //   'Forgot Password ?',
                    //   style: TextStyle(
                    //       color: Color(0xff1A4F2F),
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 15),
                    // 
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(()=>HomePage());
                        //  loginController.HomePage();
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => loginController.SignupScreen(),
                        //     ));
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
          // Rest of your UI code remains the same
        //   Padding(
        //     padding: const EdgeInsets.only(bottom: 30, top: 90),
        //     child: TextFormField(
        //       controller: _loginController.emailController,
        //       // ... rest of the code
        //     ),
        //   ),
        //   TextFormField(
        //     controller: _loginController.passwordController,
        //     // ... rest of the code
        //   ),
        //   SizedBox(
        //     height: 40,
        //   ),
        //   ElevatedButton(
        //     onPressed: _loginController.login,
        //     // ... rest of the code
        //   ),
        //   TextButton(
        //     onPressed: _loginController.resetPassword,
        //     // ... rest of the code
        //   ),
        //   // ... rest of the code
        // ),
      ),
    );
  }
}














//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   height: 200,
//                   width: 200,
//                   child: Image.network(
//                       'https://cms-assets.tutsplus.com/uploads/users/343/posts/23627/preview_image/tutsplus-icon.png'),
//                 ),
//                 const Center(
//                   child: Text(
//                     'LOGIN PAGE',
//                     style: TextStyle(
//                         color: Color(0xff1A4F2F),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 35),
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   'Login To Your Account ',
//                   style: TextStyle(
//                       color: Color(0xffA8A8A8),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 30, top: 90),
//                   child: TextFormField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       hintText: 'Email',
//                       filled: true,
//                       fillColor: Color(0xffE0E9E4),
//                       hintStyle: TextStyle(
//                           color: Color(0xff1A4F2F),
//                           fontWeight: FontWeight.bold),
//                       prefixIcon: Icon(
//                         Icons.person,
//                         color: Color(0xff1A4F2F),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                     ),
//                     validator: (item) {
//                       return item!.contains("@") ? null : "Enter valid Email";
//                     },
//                     onChanged: (item) {},
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
                   
//                     hintText: 'Password',
//                     filled: true,
//                     fillColor: Color(0xffE0E9E4),
//                     hintStyle: TextStyle(
//                         color: Color(0xff1A4F2F), fontWeight: FontWeight.bold),
//                     prefixIcon: Icon(
//                       Icons.lock,
//                       color: Color(0xff1A4F2F),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your password address';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       'Remember Me',
//                       style: TextStyle(
//                           color: Color(0xffA8A8A8),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15),
//                     ),
//                     //   Icon(Icons.check_box_sharp),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         forgetpassword();
//                       },
//                       child: Text(
//                         'Forgot Password?',
//                         style: TextStyle(
//                           color: Color(0xff1A4F2F),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),

//                     // Text(
//                     //   'Forgot Password ?',
//                     //   style: TextStyle(
//                     //       color: Color(0xff1A4F2F),
//                     //       fontWeight: FontWeight.bold,
//                     //       fontSize: 15),
//                     // 
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           logIn();
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: Color(0xff1A4F2F),
//                         ),
//                         child: const Text(
//                           'LogIn',
//                           style: TextStyle(color: Colors.white),
//                         ))),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       'Dont have an account?',
//                       style: TextStyle(
//                           color: Color(0xffA3A3A3),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SignupScreen(),
//                             ));
//                       },
//                       child: Text(
//                         'Sign up',
//                         style: TextStyle(
//                             color: Color(0xff1A4F2F),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void logIn() {
//     if (_formKey.currentState!.validate()) {
      

//       FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//               email: _emailController.text, password: _passwordController.text)
//           .then((userCredential) {
//         try {} catch (e) {
//           print("ERRORR:: $e");
//         }
//         if (userCredential.user!.emailVerified == true) {
//           print(userCredential.user!.emailVerified);

//           Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => HomePage(),
//               ));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('verifcation send to mail id')));
//           verfyemail();
//         }

        
//         log(userCredential.user!.uid);
//       }).catchError((error) {
        
//         log("$error");
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text(
//               error.toString(),
//             ),
//             duration: Duration(seconds: 5)));
//       });
//     }
//   }

//   void forgetpassword() async {
//     if (_emailController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Please enter your email."),
//         duration: Duration(seconds: 3),
//       ));
//       return;
//     }

//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(
//         email: _emailController.text,
//       );
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Password reset email sent."),
//         duration: Duration(seconds: 5),
//       ));
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(e.toString()),
//         duration: Duration(seconds: 5),
//       ));
//     }
//   }

//   void verfyemail() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null && !user.emailVerified) {
//       await user.sendEmailVerification();
//     }
//   }
// }













