import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import './../../others/all.dart';

class DetailWid extends StatelessWidget {
  final Size size;
  final Product detail;
  const DetailWid({Key? key, required this.size, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.34,
              margin: EdgeInsets.only(
                left: size.width * 0.05,
                right: size.width * 0.05,
                top: size.height * 0.09,
              ),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container()),
                  Text(
                    detail.title,
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600,
                      color: txtcol,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Text(
                        "EGP  ",
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w600,
                          color: txtcol,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: prim,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 20,
                              color: txtcol.withOpacity(0.23),
                            ),
                          ],
                        ),
                        child: Text(
                          detail.price.toString(),
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            color: whit,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.3,
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: 20,
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.14),
              decoration: BoxDecoration(
                color: whit,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 20,
                    color: txtcol.withOpacity(0.23),
                  ),
                ],
              ),
              child: CachedNetworkImage(
                imageUrl: detail.image,
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(color: prim),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: 50,
            bottom: 20,
          ),
          child: Text(
            detail.name,
            style: TextStyle(
                fontSize: size.width * 0.045,
                color: txtcol,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: 2,
          ),
          child: detail.description == "null"
              ? Container()
              : Text(
                  detail.description,
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    color: txtcol,
                  ),
                  textAlign: TextAlign.justify,
                ),
        ),
      ],
    );
  }
}
