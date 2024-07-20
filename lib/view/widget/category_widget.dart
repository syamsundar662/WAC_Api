import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:web_and_craft/model/model.dart';

class CategoryWidget extends StatelessWidget {
  final List<Content> categories;

  const CategoryWidget(this.categories, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              
                Text('View all',
                    style: TextStyle(fontSize: 14,)),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryItem(categories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Content category;

  const CategoryItem(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            // child:   const SizedBox(height: 8),
         child: Column(
           children: [
             SizedBox(
              height: 60,
              width: 60,
              child: CachedNetworkImage(imageUrl: category.imageUrl!,)),
             Text(category.title!, style: const TextStyle(fontSize: 12)),
           ],
         ),
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: .5,color: Colors.grey)
              
              ),
            ),
          
        
        ],
      ),
    );
  }
}
