import 'package:flutter/material.dart';

class CustMeth {
  replash(BuildContext context, Widget widget) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
