import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SingleBannerWidget extends StatelessWidget {
  final String imageUrl;

  SingleBannerWidget(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 160,
          width: double.infinity,
          child:ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(imageUrl: imageUrl,fit: BoxFit.cover,))),
    );
  }
}
