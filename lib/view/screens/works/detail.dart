import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './../../../others/all.dart';

class DetailScreen extends StatelessWidget {
  final Product detail;
  const DetailScreen({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: screenback,
      appBar: AppBar(
        backgroundColor: prim,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        title: const Text("Detail"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      DetailWid(
                        size: size,
                        detail: detail,
                      ),
                      SizedBox(height: size.height * 0.13),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: DetailBadge(
              size: size,
              pid: detail.id,
              price: detail.price,
            ),
          ),
        ],
      ),
    );
  }
}
