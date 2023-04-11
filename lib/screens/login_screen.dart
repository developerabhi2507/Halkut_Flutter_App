import 'package:flutter/material.dart';
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
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool loggedIn = false;
  bool isObscure = true;

  @override
  void initState() {
    // Initialize all controllers.
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose all controllers.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                          (MediaQuery.of(context).size.height - 295),
                    ),
                    buildLoginText(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 25),
                    ),
                    buildEmailTf(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 16),
                    ),
                    buildPasswordTf(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 16),
                    ),
                    buildForgotPassword(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 16),
                    ),
                    buildContinueWithText(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 15),
                    ),
                    buildSocialLogin(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 57),
                    ),
                    buildLoginBtn(),
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

  Widget buildLoginText() {
    return const Align(
      alignment: Alignment.bottomLeft,
      child: Text('Login',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: AppConstants.fontColor,
              fontSize: 28,
              fontWeight: FontWeight.w700)),
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

  Widget buildForgotPassword() {
    return TextButton(
      onPressed: () {
        // handle forgot password logic
      },
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
          alignment: Alignment.centerRight),
      child: Text(
        'Forgot Password?',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: AppConstants.fontColor.withOpacity(0.4),
        ),
      ),
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

  Widget buildLoginBtn() {
    return TextButton(
        onPressed: () {
          Get.to(const HomeScreen());
        },
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ));
  }
}
