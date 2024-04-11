import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loginpage_using_api_integration/view/home_screen.dart';
import 'package:loginpage_using_api_integration/view/signup_screen.dart';
import 'package:loginpage_using_api_integration/view/validation/user_validation.dart';

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
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30.0, left: 20, right: 20, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container - 1
                Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/casual-t-shirt-.png",
                        height: 50,
                        width: 70,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailmobileController,
                        onChanged: (text) {
                          UserValidation.chatText(text);
                        },
                        validator: (value) {
                          if (UserValidation.which == 1) {
                            String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
                            RegExp regExp = new RegExp(patttern);
                            if (value?.length == 0) {
                              return 'Please enter mobile number';
                            } else if (!regExp.hasMatch(value!)) {
                              return 'Please enter valid mobile number';
                            }
                            return null;
                          } else if (UserValidation.which == 2) {
                            String patttern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regExp = new RegExp(patttern);
                            if (value?.length == 0) {
                              return 'Please enter email address';
                            } else if (!regExp.hasMatch(value!)) {
                              return 'Please enter valid email address';
                            }
                            return null;
                          } else if (UserValidation.which == 0) {
                            return 'Please enter mobile or email';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Mobile / Email",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
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
                          hintText: "Password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => HomeActivity()),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: isSignIn
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Sign in",
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
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 18, letterSpacing: 1),
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
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup_activity()));
                          },
                          child: const Text(
                            " SignUp",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
