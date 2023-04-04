import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halkut_demo1/constants/constants.dart';
import 'package:halkut_demo1/screens/login_screen.dart';

import 'register_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icondata(),
            Container(
              padding: const EdgeInsets.only(left: 4.94),
              child: AppConstants.title,
            ),
          ],
        ),
        // title: AppConstants.title,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // margin: EdgeInsets.only(
              //   top: MediaQuery.of(context).size.height -
              //       (MediaQuery.of(context).size.height - 180),
              // ),
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height - 240),
              width: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width - 240),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/onBoarding_background.png'))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height - 48),
            ),
            const Text(
              'Welcome to Halkut',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height - 8),
            ),
            Text(
                'Free movie streaming all your needs\n everytime and everywhere.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppConstants.fontColor.withOpacity(0.6))),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height - 147),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width - 335),
                child: TextButton(
                    onPressed: () {
                      Get.to(const RegisterScreen());
                    },
                    child: const Text('Watch Movie'))),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height - 24),
            ),
            TextButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.transparent),
                    foregroundColor:
                        MaterialStatePropertyAll(AppConstants.fontColor)),
                onPressed: () => Get.to(const LoginScreen()),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ))
          ],
        ),
      ),
    );
  }
}

class Icondata extends StatelessWidget {
  const Icondata({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
