import 'package:flutter/material.dart';

/// This is the class for to change theme colour
class AppStyleModeNotifier extends ChangeNotifier {
  bool mode = true; //0 for light and 1 for dark
  Color primaryBackgroundColor = Colors.white;
  Color appBarBackgroundColor = Colors.cyan;
  Color boxTextColor = Colors.indigo;
  Color primaryTextColor = Colors.black;
  Color dashboardColor = Colors.white;

  switchMode() {
    if (mode == true) {
      //if it is light mode currently switch to dark
      primaryBackgroundColor = Colors.grey;
      appBarBackgroundColor = Colors.black;
      boxTextColor = Colors.black;
      primaryTextColor = Colors.white;
      dashboardColor = Colors.black;

      mode = false;
    } else {
      //if it is dark mode currently switch to light
      primaryBackgroundColor = Colors.white;
      appBarBackgroundColor = Colors.cyan;
      boxTextColor = Colors.indigo;
      primaryTextColor = Colors.black;
      dashboardColor = Colors.white;

      mode = true;
    }

    notifyListeners();
  }
}
