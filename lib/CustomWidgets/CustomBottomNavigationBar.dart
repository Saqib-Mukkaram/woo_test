import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      () => Container(
        constraints: BoxConstraints(
          minHeight: 80,
          maxHeight: 80,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          // backgroundColor: Colors.transparent,

          currentIndex: selectedIndex.value,
          onTap: (index) {
            selectedIndex.value = index;
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
            BottomNavigationBarItem(icon: SizedBox.shrink(), label: ""),
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
      ),
    );
  }
}
