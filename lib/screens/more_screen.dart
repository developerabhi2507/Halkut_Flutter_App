import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halkut_demo1/screens/edit_profile_screen.dart';
import 'dart:ui' as ui;

import '../constants/constants.dart';
import 'bottom_nav_bar.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen(
      {super.key, this.backgroundImage, this.profileImage, this.username});
  final String? backgroundImage;
  final String? profileImage;
  final String? username;

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

int _selectedIndex = 4;

class _MoreScreenState extends State<MoreScreen> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleTextStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppConstants.fontColor),
          title: const Text('More'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.inbox_outlined,
                  size: 24,
                  color: AppConstants.fontColor,
                ))
          ],
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(
                    widget.backgroundImage!,
                    width: MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width - 375),
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - 195),
                    fit: BoxFit.cover,
                  ),
                  BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: AppConstants.backgroundColor.withOpacity(0.9),
                    ),
                  ),
                  Positioned.fill(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Container(
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 120),
                            height: MediaQuery.of(context).size.height -
                                (MediaQuery.of(context).size.height - 120),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(widget.profileImage!)))),
                      ),
                    ],
                  ))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - 23),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Hi, ${widget.username} 👋 ',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - 6),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '48 times watch movie on Muvi ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppConstants.fontColor.withOpacity(0.7)),
                    ),
                  ),
                  Divider(
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - 24),
                    color: AppConstants.fontColor.withOpacity(0.38),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                AppConstants.backgroundColor)),
                        onPressed: () {
                          Get.to(const EditProfileScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              // <-- Icon
                              Icons.person_2_outlined,
                              size: 24.0,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    (MediaQuery.of(context).size.width - 16)),

                            const Text(
                              'Account Settings',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ), // <-- Text
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    (MediaQuery.of(context).size.width - 109)),

                            const Icon(
                              // <-- Icon
                              Icons.arrow_forward_ios_outlined,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 12)),
                  ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            AppConstants.backgroundColor)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          // <-- Icon
                          Icons.settings_outlined,
                          size: 24.0,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 16)),

                        const Text(
                          'App Settings',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ), // <-- Text
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 138)),

                        const Icon(
                          // <-- Icon
                          Icons.arrow_forward_ios_outlined,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 12)),
                  ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            AppConstants.backgroundColor)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          // <-- Icon
                          Icons.thumb_up_outlined,
                          size: 24.0,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 16)),

                        const Text(
                          'Rate us on Appstore',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ), // <-- Text
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 88)),

                        const Icon(
                          // <-- Icon
                          Icons.arrow_forward_ios_outlined,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 12)),
                  ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            AppConstants.backgroundColor)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          // <-- Icon
                          Icons.help_outline,
                          size: 24.0,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 16)),

                        const Text(
                          'Help',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ), // <-- Text
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 190)),

                        const Icon(
                          // <-- Icon
                          Icons.arrow_forward_ios_outlined,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 12)),
                  ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            AppConstants.backgroundColor)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          // <-- Icon
                          Icons.logout_outlined,
                          size: 24.0,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 16)),

                        const Text(
                          'Sign out',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ), // <-- Text
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 192)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height - 54),
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          onTap: _onItemTapped,
        ));
  }
}
