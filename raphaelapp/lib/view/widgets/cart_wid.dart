import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import './../../others/all.dart';

class CartWid extends StatelessWidget {
  final Size size;
  final int length;
  final int index;
  final String title;
  final String image;
  final int price;
  final int count;
  final Function addfunc;
  final Function removefunc;
  const CartWid({
    Key? key,
    required this.size,
    required this.length,
    required this.index,
    required this.title,
    required this.image,
    required this.price,
    required this.count,
    required this.addfunc,
    required this.removefunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: containerdeco,
      margin: EdgeInsets.only(
        left: size.width * 0.03,
        right: size.width * 0.03,
        top: 15,
        bottom: length - 1 == index ? size.height * 0.1 : 15,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: 20,
      ),
      child: Row(
        children: [
          Container(
            width: size.width * 0.25,
            alignment: Alignment.center,
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(color: prim),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: size.width * 0.042,
                    color: txtcol,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 12),
                Text(
                  "${price.toString()} EGP",
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: size.width * 0.048,
                    fontWeight: FontWeight.w600,
                    color: txtcol,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  removefunc();
                },
                child: Icon(
                  Icons.remove_circle,
                  size: size.width * 0.07,
                  color: redi,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.w600,
                  color: txtcol,
                ),
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {
                  addfunc();
                },
                child: Icon(
                  Icons.add_circle,
                  size: size.width * 0.07,
                  color: grn,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
