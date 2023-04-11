import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halkut_demo1/screens/login_screen.dart';

import '../constants/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  bool loggedIn = false;
  bool isObscure = true;

  @override
  void initState() {
    // Initialize all controllers.
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose all controllers.
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget buildCreateAccTxt() {
    return const Align(
      alignment: Alignment.bottomLeft,
      child: Text('Create Account',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: AppConstants.fontColor,
              fontSize: 28,
              fontWeight: FontWeight.w700)),
    );
  }

  Widget buildTxt1() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Enter information below or login with social \naccount to get started',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppConstants.fontColor.withOpacity(0.7)),
      ),
    );
  }

  // Create email textfield widget
  Widget buildEmailTf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: TextStyle(
              fontSize: 10,
              color: AppConstants.fontColor,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 7),
        ),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 48),
          child: TextFormField(
            controller: _emailController,
            autofocus: true,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
                color: AppConstants.fontColor,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppConstants.fontColor.withOpacity(0.12)),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppConstants.fontColor),
              ),
              hintText: 'Enter your email here',
              hintStyle:
                  TextStyle(color: AppConstants.fontColor.withOpacity(0.12)),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              suffixIcon: const Icon(
                Icons.email_outlined,
                color: AppConstants.prefixIconColor,
              ),
            ),
            validator: ((value) {
              if (value!.isEmpty ||
                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                return "Enter Correct Email Address";
              } else {
                return null;
              }
            }),
          ),
        )
      ],
    );
  }

  // Create password textfield widget
  Widget buildPasswordTf() {
    // double passStrength = 0;
    String displayText = 'Please enter a password';
    RegExp numReg = RegExp(r".*[0-9].*");
    RegExp letterReg = RegExp(r".*[A-Za-z].*");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: TextStyle(fontSize: 10, color: AppConstants.fontColor),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 7),
        ),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 48),
          child: TextFormField(
            controller: _passwordController,
            enableSuggestions: false,
            obscureText: isObscure,
            autocorrect: false,
            keyboardType: TextInputType.visiblePassword,
            style: const TextStyle(
                color: AppConstants.fontColor,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppConstants.fontColor.withOpacity(0.12)),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppConstants.fontColor),
              ),
              hintText: displayText,
              border: InputBorder.none,
              hintStyle:
                  TextStyle(color: AppConstants.fontColor.withOpacity(0.12)),
              contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppConstants.prefixIconColor,
                ),
              ),
            ),
            validator: ((value) {
              if (value!.isEmpty ||
                  (!letterReg.hasMatch(value) && !numReg.hasMatch(value))) {
                return "Enter Correct Password";
              } else {
                return null;
              }
            }),
          ),
        )
      ],
    );
  }

  // Create confirm password textfield widget
  Widget buildConfirmPasswordTf() {
    // double passStrength = 0;
    String displayText = 'Please enter a password';
    RegExp numReg = RegExp(r".*[0-9].*");
    RegExp letterReg = RegExp(r".*[A-Za-z].*");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: TextStyle(fontSize: 10, color: AppConstants.fontColor),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 7),
        ),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 48),
          child: TextFormField(
            controller: _confirmPasswordController,
            enableSuggestions: false,
            obscureText: isObscure,
            autocorrect: false,
            keyboardType: TextInputType.visiblePassword,
            style: const TextStyle(
                color: AppConstants.fontColor,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppConstants.fontColor.withOpacity(0.12)),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppConstants.fontColor),
              ),
              hintText: displayText,
              border: InputBorder.none,
              hintStyle:
                  TextStyle(color: AppConstants.fontColor.withOpacity(0.12)),
              contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppConstants.prefixIconColor,
                ),
              ),
            ),
            validator: ((value) {
              if (value!.isEmpty ||
                  (!letterReg.hasMatch(value) && !numReg.hasMatch(value))) {
                if (_passwordController.text !=
                    _confirmPasswordController.text) {
                  return "Enter Correct Password";
                }
              } else {
                return null;
              }
            }),
          ),
        )
      ],
    );
  }

  Widget buildContinueWithText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'or continue with',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppConstants.fontColor.withOpacity(0.7)),
      ),
    );
  }

  Widget buildSocialLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
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
    );
  }

  Widget buildRegisterBtn() {
    return TextButton(
        onPressed: () {
          Get.to(const LoginScreen());
        },
        child: const Text(
          'Register',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned.fill(
              child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/images/login_background.png',
              fit: BoxFit.contain,
            ),
          )),
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 16),
                    ),
                    buildCreateAccTxt(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 9),
                    ),
                    buildTxt1(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 24),
                    ),
                    buildEmailTf(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 10),
                    ),
                    buildPasswordTf(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 10),
                    ),
                    buildConfirmPasswordTf(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 40),
                    ),
                    buildContinueWithText(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 15),
                    ),
                    buildSocialLogin(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 170),
                    ),
                    buildRegisterBtn(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 32),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
