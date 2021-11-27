import 'package:flutter/material.dart';

const String iconstg = "assets/images/icon.png";
const String iconstgwht = "assets/images/iconwht.png";

const String appname = "Raphael App";
const String passwordconst = "Password";
const String emailconst = "Email";
const String signupconst = "SignUp";
const String loginconst = "Login";
const String nameconst = "Name";
const String homeconst = "Home";
const String categoryconst = "Category";
const String cartconst = "Cart";
const String checkoutconst = "Checkout";
const String clearcartconst = "Clear Cart";

const Color prim = Color(0xFF0752AD);
const Color primlow = Color(0xFF5185c5);
const Color whit = Colors.white;
const Color screenback = Color(0xFFFAFAFA);
const Color gry = Colors.grey;
const Color txtcol = Color(0xFF305F72);
const Color redi = Colors.red;
const Color grn = Colors.green;

BoxDecoration containerdeco = BoxDecoration(
  color: whit,
  borderRadius: BorderRadius.circular(8),
  boxShadow: [
    BoxShadow(
      offset: const Offset(0, 10),
      blurRadius: 20,
      color: txtcol.withOpacity(0.23),
    ),
  ],
);

const categoryapistg = "https://retail.amit-learning.com/api/categories";
const productapistg = "https://retail.amit-learning.com/api/products";
const registerapistg = "https://retail.amit-learning.com/api/register";
const loginapistg = "https://retail.amit-learning.com/api/login";
