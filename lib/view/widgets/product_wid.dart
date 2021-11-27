import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import './../../others/all.dart';

class ProductWid extends StatelessWidget {
  final Size size;
  final Product product;
  final Function prodfunc;
  const ProductWid({
    Key? key,
    required this.size,
    required this.product,
    required this.prodfunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        prodfunc();
      },
      child: Container(
        decoration: containerdeco,
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(color: prim),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product.title,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: txtcol,
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 2),
            Text(
              "${product.price} EGP",
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: size.width * 0.045,
                fontWeight: FontWeight.w600,
                color: prim,
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
