import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import 'home_screen.dart';
import 'search_results_screen.dart';
import 'search_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.onTap});
  final ValueChanged<int> onTap;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor: AppConstants.textButtonColor,
      selectedItemColor: AppConstants.textButtonBackgroundColor,
      unselectedItemColor: AppConstants.fontColor,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          widget.onTap(index);
          switch (index) {
            case 0:
              // Navigate to home screen
              Get.to(const HomeScreen());
              break;
            case 1:
              // Navigate to search screen
              Get.to(SearchScreen());
              break;
            case 2:
              // Navigate to folder screen
              Get.back();
              break;
            case 3:
              // Navigate to folder screen
              Get.back();
              break;
          }
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: AppConstants.textButtonColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
            backgroundColor: AppConstants.textButtonColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.folder_outlined),
            label: 'Folder',
            backgroundColor: AppConstants.textButtonColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.apps_outlined),
            label: 'Grid',
            backgroundColor: AppConstants.textButtonColor),
      ],
    );
  }
}
