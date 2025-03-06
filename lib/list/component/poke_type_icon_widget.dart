import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poke_facts/core/models/poke_type.dart';

class PokeTypeIcon extends StatelessWidget {
  final PokeType type;
  final double size;

  const PokeTypeIcon({super.key, required this.type, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      type.assetPath,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
