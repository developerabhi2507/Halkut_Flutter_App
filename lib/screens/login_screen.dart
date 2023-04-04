import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:halkut_demo1/screens/register_screen.dart';

import '../constants/constants.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(9, 11, 0, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      AppConstants.iconBackgroundColor1,
                      AppConstants.iconBackgroundColor2
                    ],
                  )),
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height - 35),
              width: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width - 46.92),
              child: FloatingActionButton.extended(
                label: const Text(
                  'H',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.iconColor),
                ),
                backgroundColor: Colors.transparent,
                onPressed: () {},
              ),
            ),
            // AppConstants.title,
          ],
        ),
        titleSpacing: 5,
        title: AppConstants.title,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 9, 20, 0),
              child: InkWell(
                onTap: () {
                  Get.to(const RegisterScreen());
                },
                child: const Text(
                  'REGISTER',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppConstants.textButtonBackgroundColor),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
                child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/images/login_background.png',
                fit: BoxFit.contain,
              ),
            )),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Login',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppConstants.fontColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                            fontSize: 10,
                            color: AppConstants.fontColor,
                            fontWeight: FontWeight.w400),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppConstants.fontColor.withOpacity(0.12)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppConstants.fontColor),
                        ),
                        suffixIcon: const Icon(
                          Icons.email_outlined,
                          color: AppConstants.prefixIconColor,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        color: AppConstants.fontColor,
                      ),
                      cursorColor: AppConstants.fontColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppConstants.fontColor),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppConstants.fontColor.withOpacity(0.12)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: AppConstants.fontColor),
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility_off_outlined,
                          color: AppConstants.prefixIconColor,
                        ),
                      ),
                      obscureText: true,
                      style: const TextStyle(
                        color: AppConstants.fontColor,
                      ),
                      cursorColor: AppConstants.fontColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {
                      // handle forgot password logic
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent),
                        alignment: Alignment.centerRight),
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppConstants.fontColor.withOpacity(0.4),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'or continue with',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppConstants.fontColor.withOpacity(0.7)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            // Handle Google login here
                          },
                          child: Container(
                            height: 44,
                            width: 44,
                            decoration: const BoxDecoration(
                              color: AppConstants.socialIconBackgroundColor,
                            ),
                            child: Image.asset(
                              'assets/images/google_logo.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            // Handle Facebook login here
                          },
                          child: Container(
                            height: 44,
                            width: 44,
                            decoration: const BoxDecoration(
                              color: AppConstants.socialIconBackgroundColor,
                            ),
                            child: Image.asset(
                              'assets/images/facebook_logo.png',
                              height: 24,
                              width: 24,
                              color: AppConstants.fbIconColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 57,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 32),
                    child: TextButton(
                        onPressed: () {
                          Get.to(const HomeScreen());
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
