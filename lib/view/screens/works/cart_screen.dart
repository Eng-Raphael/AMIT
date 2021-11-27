import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './../../../others/all.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final _cont = Get.put(GlobController());
    return Obx(
      () {
        if (_cont.cartlist.isEmpty) {
          return Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/cart.png",
                fit: BoxFit.contain,
              ),
            ),
          );
        } else {
          return Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: _cont.cartlist.length,
                itemBuilder: (context, i) {
                  int _index = _cont.productlist.indexWhere(
                      (element) => element.id == _cont.cartlist[i].id);
                  return CartWid(
                    size: size,
                    length: _cont.cartlist.length,
                    index: i,
                    title: _cont.productlist[_index].title,
                    image: _cont.productlist[_index].image,
                    price: _cont.productlist[_index].price *
                        _cont.cartlist[i].count,
                    count: _cont.cartlist[i].count,
                    addfunc: () {
                      _cont.addindb(
                        _cont.cartlist[i].id,
                        (_cont.cartlist[i].count + 1),
                        _cont.cartlist[i].price,
                      );
                    },
                    removefunc: () {
                      if (_cont.cartlist[i].count == 1) {
                        _cont.deleteprodindb(_cont.cartlist[i].id);
                      }
                      if (_cont.cartlist[i].count > 1) {
                        _cont.addindb(
                          _cont.cartlist[i].id,
                          (_cont.cartlist[i].count - 1),
                          _cont.cartlist[i].price,
                        );
                      }
                    },
                  );
                },
              ),
              Positioned(
                bottom: 20,
                child: SizedBox(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Halfbutton(
                        size: size,
                        color: redi,
                        title: clearcartconst,
                        halfunc: () {
                          _cont.clearcartindb();
                        },
                      ),
                      Halfbutton(
                        size: size,
                        color: prim,
                        title: checkoutconst,
                        halfunc: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
