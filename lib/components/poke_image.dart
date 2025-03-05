import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokeImage extends StatelessWidget {
  final String url;
  const PokeImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: 80,
      height: 80,
      placeholder:
          (context, url) => Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
      errorWidget:
          (context, url, error) => Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            child: const Icon(Icons.error),
          ),
    );
  }
}
