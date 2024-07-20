import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:web_and_craft/model/model.dart';

class ProductWidget extends StatelessWidget {
  final List<Content> products;

  ProductWidget(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Featured Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductItem(products[index]);
          },
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final Content product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(imageUrl: product.productImage!, height: 100, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.productName!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.actualPrice != product.offerPrice)
                  Text(product.actualPrice!, style: TextStyle(decoration: TextDecoration.lineThrough)),
                Text(product.offerPrice!, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                if (product.discount != null && product.discount!.isNotEmpty)
                  Text(product.discount!, style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
