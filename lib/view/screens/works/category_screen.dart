import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import './../../../others/all.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _cont = Get.put(GlobController());

  @override
  void initState() {
    _cont.categoryfetchget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Obx(() {
      if (_cont.cateload.value == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          itemCount: _cont.categorylist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 25,
            childAspectRatio: 2 / 2.2,
          ),
          itemBuilder: (BuildContext context, int i) {
            return CategoryWid(
              size: size,
              category: _cont.categorylist[i],
              catefunc: () {
                pushNewScreen(
                  context,
                  screen: CatewiseProdScreen(
                    id: _cont.categorylist[i].id,
                    title: _cont.categorylist[i].title,
                  ),
                  withNavBar: false,
                );
              },
            );
          },
        );
      }
    });
  }
}
