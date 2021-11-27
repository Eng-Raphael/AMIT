import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import './../../../others/all.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cont = Get.put(GlobController());
    final Size size = MediaQuery.of(context).size;
    return Obx(() {
      return _cont.productlist.isEmpty
          ? Center(
              child: Text(
                "No Data Found !",
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  color: txtcol,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              itemCount: _cont.productlist.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 25,
                childAspectRatio: 2 / 2.6,
              ),
              itemBuilder: (BuildContext context, int i) {
                return ProductWid(
                  size: size,
                  product: _cont.productlist[i],
                  prodfunc: () {
                    pushNewScreen(
                      context,
                      screen: DetailScreen(
                        detail: _cont.productlist[i],
                      ),
                      withNavBar: false,
                    );
                  },
                );
              },
            );
    });
  }
}
