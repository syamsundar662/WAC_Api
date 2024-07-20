import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_and_craft/model/model.dart';
import 'package:web_and_craft/utils/constants.dart';

class ProductWidget extends StatelessWidget {
  final List<Content> products;

  const ProductWidget(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0,right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Most Popular',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('View all',
                  style: TextStyle(
                    fontSize: 14,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 250, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return ProductItem(products[index]);
            },
          ),
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final Content product;

  const ProductItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    print(product.offerPrice);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150, // Adjust the width as needed
        child: Container(
          decoration: BoxDecoration(
                border: Border.all(width: .5,color: Colors.grey),borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    height: 100,
                    imageUrl: product.productImage!,
                    // fit: BoxFit.cover,
                  ),
                ),
                kHeight10,
                if (product.discount != null && product.discount!.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        'Sales${product.discount!}',
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ),
                Text(
                  product.productName!,
                  style:
                      const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.offerPrice!,
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    if (product.actualPrice != product.offerPrice)
                      Text(
                        product.actualPrice!,
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
