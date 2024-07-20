import 'package:flutter/material.dart';

class SingleBannerWidget extends StatelessWidget {
  final String imageUrl;

  SingleBannerWidget(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}
