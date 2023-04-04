import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/constants.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'SF Pro Display',
          scaffoldBackgroundColor: AppConstants.backgroundColor,
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStatePropertyAll(AppConstants.textButtonColor),
                  minimumSize: MaterialStatePropertyAll(Size.fromHeight(36)),
                  backgroundColor: MaterialStatePropertyAll(
                      AppConstants.textButtonBackgroundColor),
                  textStyle: MaterialStatePropertyAll(TextStyle(
                      color: AppConstants.textButtonColor, fontSize: 14)))),
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: AppConstants.fontColor),
              bodyMedium: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: AppConstants.fontColor)),
          appBarTheme: const AppBarTheme(
              toolbarHeight: 56,
              backgroundColor: AppConstants.backgroundColor,
              centerTitle: true,
              titleTextStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              iconTheme: IconThemeData(color: AppConstants.iconColor))),
      home: const OnboardingScreen(),
    );
  }
}
