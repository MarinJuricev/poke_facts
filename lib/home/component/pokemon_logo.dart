import 'package:flutter/material.dart';
import 'package:poke_facts/presentation/images.dart';

class PokemonLogo extends StatelessWidget {
  const PokemonLogo({
    super.key,
    this.widthFactor = 0.65,
    this.heightFactor = 0.65,
    this.alignment = Alignment.topRight,
    this.iconWidth,
  });

  final double widthFactor;
  final double heightFactor;
  final double? iconWidth;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: alignment,
      child: ClipRect(
        child: Align(
          alignment: Alignment.bottomLeft,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: Image.asset(
            AppAssets.pokeball,
            width: iconWidth ?? screenWidth * 0.65,
            color: Colors.grey.withValues(alpha: 0.15),
            colorBlendMode: BlendMode.modulate,
          ),
        ),
      ),
    );
  }
}
