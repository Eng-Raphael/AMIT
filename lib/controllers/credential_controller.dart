import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './../others/all.dart';

class CredentialController extends GetxController {
  TextEditingController rname = TextEditingController();
  TextEditingController remail = TextEditingController();
  TextEditingController rpassword = TextEditingController();

  TextEditingController lemail = TextEditingController();
  TextEditingController lpassword = TextEditingController();

  custsnak(String error) {
    Get.snackbar(
      "Alert !",
      error,
      backgroundColor: redi,
      borderRadius: 10,
      snackPosition: SnackPosition.TOP,
      colorText: whit,
    );
  }

  registerget(
    Function done,
    Function notdone,
  ) {
    if (rname.text.isEmpty || remail.text.isEmpty || rpassword.text.isEmpty) {
      custsnak("All Feilds are Required !");
      notdone();
    } else if (rpassword.text.length < 6) {
      custsnak("Password should be a 6 Charactrer Long !");
      notdone();
    } else if (remail.text.contains("@") == false &&
        remail.text.contains(".") == false) {
      custsnak("Please Enter the Valide Email !");
      notdone();
    } else {
      APIservice().registerapi(
        rname.text,
        remail.text,
        rpassword.text,
        (String token) async {
          SharedPreferences _prefs = await SharedPreferences.getInstance();
          await _prefs.setString("Email", remail.text);
          await _prefs.setString("Password", rpassword.text);
          await _prefs.setString("Token", token);
          done();
        },
        (String error) {
          custsnak(error);
          notdone();
        },
      );
    }
  }

  loginget(
    Function done,
    Function notdone,
  ) {
    if (lemail.text.isEmpty || lpassword.text.isEmpty) {
      custsnak("All Feilds are Required !");
      notdone();
    } else if (lpassword.text.length < 6) {
      custsnak("Password should be a 6 Charactrer Long !");
      notdone();
    } else if (lemail.text.contains("@") == false ||
        lemail.text.contains(".") == false) {
      custsnak("Please Enter the Valide Email !");
      notdone();
    } else {
      APIservice().loginapi(
        lemail.text,
        lpassword.text,
        (String token) async {
          SharedPreferences _prefs = await SharedPreferences.getInstance();
          await _prefs.setString("Email", lemail.text);
          await _prefs.setString("Password", lpassword.text);
          await _prefs.setString("Token", token);
          done();
        },
        (String error) {
          custsnak(error);
          notdone();
        },
      );
    }
  }

  autologin(
    Function nologinfunc,
    Function loginfunc,
  ) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String _email = _prefs.getString("Email") ?? "null";
    String _password = _prefs.getString("Password") ?? "null";

    if (_email == "null" || _password == "null") {
      nologinfunc();
    } else {
      APIservice().loginapi(
        _email,
        _password,
        (String token) {
          loginfunc();
        },
        (String error) {
          nologinfunc();
        },
      );
    }
  }
}
