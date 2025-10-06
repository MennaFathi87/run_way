import 'package:flutter/material.dart';

class ProductFilter extends StatelessWidget {
  const ProductFilter(
      {super.key,
      required this.image,
      required this.txt,
      required this.price,
      required this.onTap});
  final String image, txt, price;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 255,
            decoration: BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Stack(
              children: [
                Center(child: Image.asset(image)),
                Positioned(
                  bottom: 0,
                  right: 10,
                  left: 10,
                  child: Image.asset("asssets/Ellipse 5.png"),
                ),
              ],
            ),
          ),
          Text(txt),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [Text(price), Icon(Icons.favorite)],
          ),
        ],
      ),
    );
  }
}
