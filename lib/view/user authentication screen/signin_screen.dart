// ignore_for_file: camel_case_types, duplicate_ignore
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_using_api_integration/view/profile%20screen/userprofile_screen.dart';
import 'package:loginpage_using_api_integration/view/user%20authentication%20screen/signup_screen.dart';
import 'package:loginpage_using_api_integration/view/validation/user_validation.dart';

// ignore: camel_case_types
class Signin_activity extends StatefulWidget {
  const Signin_activity({super.key});

  @override
  State<Signin_activity> createState() => _Signin_activityState();
}

class _Signin_activityState extends State<Signin_activity> {
  // ---------------------------------------------------------------------------

  bool isSignIn = false;

  TextEditingController emailmobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signinPostApi() async {
    try {
      var dio = Dio();
      Response response = await dio
          .post('http://localhost:8080/loginsystem/students/login', data: {
        "email": emailmobileController.text,
        "password": passwordController.text,
      });
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Login Successfully',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xff098395),
          ),
        );

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const UserProfileScreen()),
            (Route<dynamic> route) => false);
        print(response.data);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Login Failed',
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.white,
        ),
      );
    }
  }

  @override
  void dispose() {
    emailmobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  // ===========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff132E39),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container - 1
                Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(80.0),
                          bottomLeft: Radius.circular(80.0)),
                      // image: DecorationImage(
                      //     image: AssetImage(
                      //       "assets/images/shoes-970354_1280.jpeg",
                      //     ),
                      //     fit: BoxFit.cover)
                      color: Color(0xff36D0C7)),
                  child: Image.asset("assets/images/casual-t-shirt-.png",
                      height: 10,
                      width: 10,
                      fit: BoxFit.contain,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),

                Form(
                  key: _formKey,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 20.0, left: 20, top: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: emailmobileController,
                          onChanged: (text) {
                            UserValidation.chatText(text);
                          },
                          validator: (value) {
                            if (UserValidation.which == 1) {
                              String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
                              RegExp regExp = RegExp(patttern);
                              if (value?.length == 0) {
                                return 'Please enter mobile number';
                              } else if (!regExp.hasMatch(value!)) {
                                return 'Please enter valid mobile number';
                              }
                              return null;
                            } else if (UserValidation.which == 2) {
                              String patttern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regExp = RegExp(patttern);
                              if (value!.isEmpty) {
                                return 'Please enter email address';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Please enter valid email address';
                              }
                              return null;
                            } else if (UserValidation.which == 0) {
                              return 'Please enter mobile or email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(12)),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorStyle: const TextStyle(color: Colors.red),
                            hintText: "Mobile / E-mail",
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            // Perform custom password validation here
                            if (value.length < 8) {
                              return "Password must be at least 8 characters long";
                            }
                            if (!value.contains(RegExp(r'[A-Z]'))) {
                              return "Password must contain at least one uppercase letter";
                            }
                            if (!value.contains(RegExp(r'[a-z]'))) {
                              return "Password must contain at least one lowercase letter";
                            }
                            if (!value.contains(RegExp(r'[0-9]'))) {
                              return "Password must contain at least one numeric character";
                            }
                            if (!value
                                .contains(RegExp(r'[!@#\$%^&*()<>?/|}{~:]'))) {
                              return "Password must contain at least one special character";
                            }

                            return null; // Password is valid.
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(12)),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorStyle: const TextStyle(color: Colors.red),
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      signinPostApi();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xff098395),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: isSignIn
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Log in",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    wordSpacing: 2),
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontSize: 18, letterSpacing: 1, color: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Signup_activity()));
                          },
                          child: const Text(
                            " Signup",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
