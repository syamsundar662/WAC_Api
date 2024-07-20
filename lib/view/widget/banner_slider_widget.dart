import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:web_and_craft/model/model.dart';

class BannerSliderWidget extends StatelessWidget {
  final List<Content> contents;

  BannerSliderWidget(this.contents);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: PageView(
        children: contents.map((content) {
          print('${content.imageUrl}---------------');
          return CachedNetworkImage(
            
            imageUrl: content.imageUrl!,
            width: 10,
            height: 10,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        }).toList(),
      ),
    );
  }
}
