// ignore_for_file: avoid_print

import 'package:get/utils.dart';

class UserValidation {
  static int which = 0;

  static chatText(String text) {
    if (text.isNum) {
      // ignore: duplicate_ignore
      // ignore: avoid_print
      print("$text is a mobile number");
      which = 1;
    } else if (text.isEmail) {
      print("$text is a email address");
      which = 2;
    } else if (text.isEmpty) {
      which = 0;
    }
  }

  static void login() {
    if (which == 1) {
      print("Run a method from mobile number");
    } else if (which == 2) {
      print("Run a method from email address");
    } else {
      print("Textfield is empty");
    }
  }

// ---------------------------------------------
}
