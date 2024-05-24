import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData primaryTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    applyElevationOverlayColor: false,
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.white,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(

      // elevation: 8,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      unselectedIconTheme: IconThemeData(color: Colors.grey),
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(
        color: Colors.black,
      ),
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 0,
      mouseCursor: MaterialStateMouseCursor.clickable,
      type: BottomNavigationBarType.shifting,
    ),
  );
}
