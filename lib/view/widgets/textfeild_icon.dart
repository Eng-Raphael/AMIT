import 'package:flutter/material.dart';

import './../../others/all.dart';

class TextfeildIcon extends StatelessWidget {
  final TextEditingController controller;
  final Size size;
  final String title;
  final IconData icon;
  const TextfeildIcon({
    Key? key,
    required this.controller,
    required this.size,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size.width * 0.01,
        horizontal: size.width * 0.045,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.07,
        vertical: 18,
      ),
      decoration: containerdeco,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: TextField(
                keyboardType: title == passwordconst
                    ? TextInputType.visiblePassword
                    : TextInputType.emailAddress,
                obscureText: title == passwordconst ? true : false,
                controller: controller,
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  color: txtcol,
                ),
                decoration: InputDecoration(
                  hintText: title,
                  border: InputBorder.none,
                ),
                maxLines: 1,
              ),
            ),
          ),
          Icon(
            icon,
            color: txtcol,
          ),
        ],
      ),
    );
  }
}
