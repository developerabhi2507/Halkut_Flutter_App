import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: Text('Create Account',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppConstants.fontColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter information below or login with social \naccount to get started',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppConstants.fontColor.withOpacity(0.7)),
                      ),
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
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Confirmation Password',
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
                    height: 40,
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
                    height: 217,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 32),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Register',
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
