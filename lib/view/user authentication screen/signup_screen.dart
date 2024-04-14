// ignore_for_file: camel_case_types
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_using_api_integration/view/profile%20screen/userprofile_screen.dart';
import 'package:loginpage_using_api_integration/view/user%20authentication%20screen/signin_screen.dart';

class Signup_activity extends StatefulWidget {
  const Signup_activity({super.key});

  @override
  State<Signup_activity> createState() => _Signup_activityState();
}

class _Signup_activityState extends State<Signup_activity> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController collegenameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isSignUp = false;

  void signupPostApi() async {
    try {
      var dio = Dio();
      Response response = await dio
          .post('http://localhost:8080/loginsystem/students/put', data: {
        "first_name": firstnameController.text,
        "last_name": lastnameController.text,
        "collage_name": collegenameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "mob_no": mobileController.text,
      });
 
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Successfully Signup',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
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
            'Signup Failed',
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.white,
        ),
      );
    }
  }

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    collegenameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  // =====================================================================
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
                  "Register",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: firstnameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'First name is required';
                            }
                            if (value.contains(
                                RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]'))) {
                              return "Invalid First name";
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
                            hintStyle: const TextStyle(color: Colors.white),
                            hintText: "First name",
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
                          controller: lastnameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Last name is required';
                            }
                            if (value.contains(
                                RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]'))) {
                              return "Invalid Last name";
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
                            hintStyle: const TextStyle(color: Colors.white),
                            hintText: "Last name",
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
                          controller: collegenameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'College name is required';
                            }
                            if (value.contains(
                                RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]'))) {
                              return "Invalid College name";
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
                            hintStyle: const TextStyle(color: Colors.white),
                            hintText: "College name",
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
                          controller: mobileController,
                          validator: (value) {
                            String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
                            RegExp regExp = RegExp(patttern);
                            if (value!.isEmpty) {
                              return 'Please enter mobile number';
                            } else if (!regExp.hasMatch(value)) {
                              return 'Please enter valid mobile number';
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
                            hintStyle: const TextStyle(color: Colors.white),
                            hintText: "Mobile",
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
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          autofillHints: const [
                            AutofillHints.email,
                          ],
                          style: const TextStyle(color: Colors.white),
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            }
                            if (!value.contains(RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'))) {
                              return "Invalid Email Address";
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
                            hintStyle: const TextStyle(color: Colors.white),
                            hintText: "E-mail",
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
                            hintStyle: const TextStyle(color: Colors.white),
                            hintText: "Password",
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
                      signupPostApi();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          // color: const Color(0xff098395),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: isSignUp
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Sign up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
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
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Signin_activity()));
                          },
                          child: const Text(
                            " Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
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
