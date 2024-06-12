import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData primaryTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xffFDFDFD),
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStateProperty.all(Colors.white),
      surfaceTintColor: WidgetStateProperty.all(Colors.white),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      elevation: WidgetStateProperty.all(4),
    ),
    colorScheme:
        ColorScheme.fromSeed(seedColor: Colors.white, surface: Colors.white),
    useMaterial3: true,
    applyElevationOverlayColor: false,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    ),
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
