import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:runaway/widgets/catgory_filter.dart';
import 'package:runaway/widgets/costume_appbar.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    this.image,
    this.name,
    this.price,
  });
  final String? image, name, price;
  static String id = '/productpage';
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  //add bottom sheet
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }
 ///bottom sheet
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: bottomWidget(
            widget.name ?? "No name",
            widget.price ?? "0",
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbar(
        suffix: const Icon(Icons.menu),
        title: 'Runway',
        prefix: const Icon(Icons.notification_add),
      ),
      body: Column(
        children: [
          catagoryFilter(),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(color: Color(0xffECECEC)),
                child: Image.asset(
                  widget.image.toString(),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                left: 10,
                child: Image.asset("asssets/Ellipse 5.png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget bottomWidget(String name, String price) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Container(
          width: 42,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      const Gap(10),
      Text(
        name,
        maxLines: 1,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      const Gap(20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("€$price",
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.favorite_border),
              Gap(10),
              Text("450",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
      const Gap(20),
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(width: 0.7, color: Colors.black12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Text(
                  "Select color",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(10),
              ],
            ),
            Container(width: 2, height: 40, color: Colors.black12),
            Row(
              children: const [
                Text(
                  "Select size",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Gap(10),
              ],
            ),
          ],
        ),
      ),
      const Gap(20),
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7), color: Colors.black),
        child: const Center(
          child: Text(
            "Add To Bag",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    ],
  );
}
