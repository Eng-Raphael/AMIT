import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import './../../../others/all.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final _cont = Get.put(GlobController());

  @override
  void initState() {
    _cont.productfetchget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);
    List<Widget> _screensofbar = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
    ];

    List<PersistentBottomNavBarItem> _navbaritems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_rounded),
          title: (homeconst),
          activeColorPrimary: prim,
          inactiveColorPrimary: gry,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.category_outlined),
          title: (categoryconst),
          activeColorPrimary: prim,
          inactiveColorPrimary: gry,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart_outlined),
          title: (cartconst),
          activeColorPrimary: prim,
          inactiveColorPrimary: gry,
        ),
      ];
    }

    return Scaffold(
      backgroundColor: screenback,
      appBar: AppBar(
        backgroundColor: prim,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        title: const Text(appname),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Image.asset(iconstgwht),
        ),
      ),
      body: Obx(() {
        if (_cont.prodload.value) {
          return const Center(
            child: CircularProgressIndicator(color: prim),
          );
        } else {
          return PersistentTabView(
            context,
            controller: _controller,
            screens: _screensofbar,
            items: _navbaritems(),
            confineInSafeArea: true,
            backgroundColor: whit,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: const NavBarDecoration(
              colorBehindNavBar: whit,
              boxShadow: [
                BoxShadow(
                  color: txtcol,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(0.0, 1.0),
                ),
              ],
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style9,
          );
        }
      }),
    );
  }
}
