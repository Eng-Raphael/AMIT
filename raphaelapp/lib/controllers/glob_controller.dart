import 'package:get/get.dart';

import './../others/all.dart';

class GlobController extends GetxController {
  RxBool cateload = true.obs;
  RxList<Category> categorylist = <Category>[].obs;
  RxList<Cart> cartlist = <Cart>[].obs;

  categoryfetchget() async {
    categorylist.value = await APIservice().ctaegoryapi();
    cateload.value = false;
  }

  RxBool prodload = true.obs;
  RxList<Product> productlist = <Product>[].obs;

  productfetchget() async {
    productlist.value = await APIservice().productapi();
    getfromdb();
    prodload.value = false;
  }

  List<Product> cateoruwiseprod(int cid) {
    List<Product> _prodlist = [];
    for (int i = 0; i < productlist.length; i++) {
      if (productlist[i].cateid == cid) {
        _prodlist.add(
          Product(
            id: productlist[i].id,
            name: productlist[i].name,
            title: productlist[i].title,
            image: productlist[i].image,
            description: productlist[i].description,
            cateid: productlist[i].cateid,
            price: productlist[i].price,
          ),
        );
      }
    }
    return _prodlist;
  }

  getfromdb() async {
    final _prod = await DbHelper.getData();
    cartlist.value = _prod
        .map(
          (e) => Cart(
            id: int.parse(e["id"]),
            count: int.parse(e["count"]),
            price: int.parse(e["price"]),
          ),
        )
        .toList();
    cartlist.sort(
      (a, b) {
        return a.id.compareTo(b.id);
      },
    );
  }

  addindb(int id, int count, int price) async {
    DbHelper.insert({
      "id": id.toString(),
      "count": count.toString(),
      "price": price.toString(),
    });
    getfromdb();
  }

  deleteprodindb(int id) async {
    await DbHelper.delete(id.toString());
    getfromdb();
  }

  clearcartindb() async {
    await DbHelper.deleteall();
    getfromdb();
  }
}
