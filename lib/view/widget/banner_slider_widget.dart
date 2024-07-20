import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:web_and_craft/model/model.dart';

class BannerSliderWidget extends StatelessWidget {
  final List<Content> contents;

  const BannerSliderWidget(this.contents, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: PageView(
        children: contents.map((content) {
          return CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: content.imageUrl!,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        }).toList(),
      ),
    );
  }
}
