import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokeImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const PokeImage({
    super.key,
    required this.url,
    this.width = 80,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: BoxFit.contain,
      placeholder:
          (context, url) => Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
      errorWidget:
          (context, url, error) => Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: const Icon(Icons.error),
          ),
    );
  }
}
