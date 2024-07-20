import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:web_and_craft/model/model.dart';

class CategoryWidget extends StatelessWidget {
  final List<Content> categories;

  CategoryWidget(this.categories);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Container(
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
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Content category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: CachedNetworkImageProvider( category.imageUrl! ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(category.title!, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
