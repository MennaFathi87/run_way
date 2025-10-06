import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:runaway/models/product_model.dart';
import 'package:runaway/screens/product_screen.dart';
import 'package:runaway/widgets/catgory_filter.dart';
import 'package:runaway/widgets/costume_appbar.dart';
import 'package:runaway/widgets/product_filter.dart';

class CatagoryScreen extends StatelessWidget {
  CatagoryScreen({super.key});
  static String id = '/catagorypage';
  @override
  List<ProductModel> product = [
    ProductModel(
        image: 'asssets/cardcatagory/image 1.png',
        price: ' £25',
        txt: 'Deep gray essential regul..'),
    ProductModel(
        image: 'asssets/cardcatagory/image 2.png',
        price: ' £30',
        txt: 'Top man black'),
    ProductModel(
        image: 'asssets/cardcatagory/image 3.png',
        price: ' £25',
        txt: 'Deep gray essential regul..'),
    ProductModel(
        image: 'asssets/cardcatagory/image 4.png',
        price: ' £25',
        txt: 'Deep gray essential regul..')
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumeAppbar(
        prefix: Icon(Icons.arrow_back),
        title: 'Men',
        suffix: Icon(Icons.card_travel),
      ),
      body: Column(
        children: [
          catagoryFilter(),
          Gap(15),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 2,
                ),
                itemCount: product.length,
                itemBuilder: (context, idx) {
                  final item = product[idx];
                  return ProductFilter(
                    price: item.price,
                    image: item.image,
                    txt: item.txt,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            price: item.price,
                            name: item.txt,
                            image: item.image,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
