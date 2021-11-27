import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import './../../../others/all.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _cont = Get.put(CredentialController());
  @override
  void initState() {
    _cont.autologin(
      () {
        CustMeth().replash(
          context,
          const LoginScreen(),
        );
      },
      () {
        CustMeth().replash(
          context,
          const BottomBar(),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
        ),
        preferredSize: const Size.fromHeight(0),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: whit,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.5,
              height: size.width * 0.5,
              alignment: Alignment.center,
              child: Image.asset(
                iconstg,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.15),
            const CircularProgressIndicator(
              color: prim,
            ),
          ],
        ),
      ),
    );
  }
}
