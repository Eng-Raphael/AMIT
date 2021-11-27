import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import './../../../others/all.dart';

class CatewiseProdScreen extends StatefulWidget {
  final int id;
  final String title;
  const CatewiseProdScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  _CatewiseProdScreenState createState() => _CatewiseProdScreenState();
}

class _CatewiseProdScreenState extends State<CatewiseProdScreen> {
  bool _loading = true;
  final _cont = Get.put(GlobController());
  List<Product> _list = [];

  @override
  void initState() {
    _list = _cont.cateoruwiseprod(widget.id);
    _loading = false;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: screenback,
      appBar: AppBar(
        backgroundColor: prim,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _list.isEmpty
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  itemCount: _list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 25,
                    childAspectRatio: 2 / 2.6,
                  ),
                  itemBuilder: (BuildContext context, int i) {
                    return ProductWid(
                      size: size,
                      product: _list[i],
                      prodfunc: () {
                        pushNewScreen(
                          context,
                          screen: DetailScreen(
                            detail: _list[i],
                          ),
                          withNavBar: false,
                        );
                      },
                    );
                  },
                ),
    );
  }
}
