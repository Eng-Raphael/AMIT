import 'package:flutter/material.dart';

import './../../others/all.dart';

class Custbutton extends StatelessWidget {
  final String title;
  final Size size;
  final Function custbutfunc;
  const Custbutton({
    Key? key,
    required this.title,
    required this.size,
    required this.custbutfunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.12,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: prim,
        ),
        onPressed: () {
          custbutfunc();
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
          child: Text(
            title,
            style: TextStyle(fontSize: size.width * 0.05),
          ),
        ),
      ),
    );
  }
}
