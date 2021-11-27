import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import './../../others/all.dart';

class CategoryWid extends StatelessWidget {
  final Size size;
  final Category category;
  final Function catefunc;
  const CategoryWid({
    Key? key,
    required this.size,
    required this.category,
    required this.catefunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        catefunc();
      },
      child: Container(
        decoration: containerdeco,
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl: category.image,
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
              category.title,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: txtcol,
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
