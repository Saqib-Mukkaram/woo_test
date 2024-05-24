import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woo_test/Views/Home.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  Rx<int> selectedIndex;

  // final list;
  bool isGetoff;

  CustomBottomNavigationBarWidget(
      {super.key,
      required this.selectedIndex,
      // required this.list,
      this.isGetoff = false});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        // backgroundColor: Colors.transparent,

        currentIndex: selectedIndex.value,
        onTap: (index) {
          selectedIndex.value = index;
          // isGetoff
          //     ? Get.offAll(HomeScreen(
          //   seletedIndex: selectedIndex.value,
          // ))
          //     : null;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: ("Home"),
            activeIcon: Icon(
              Icons.home,
              size: 34,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
            ),
            label: ("Favorites"),
            activeIcon: Icon(
              Icons.favorite,
              size: 34,
            ),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.security,
          //
          //     size: 30,
          //   ),
          //   label: ("Vault"),
          //   activeIcon: Icon(
          //     Icons.security,
          //
          //     size: 34,
          //   ),
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: ("Accounts"),
            activeIcon: Icon(
              Icons.person,
              size: 34,
            ),
          ),
        ],
      ),
    );
  }
}
