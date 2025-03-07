import 'package:flutter/material.dart';
import 'package:poke_facts/home/component/pokemon_logo.dart';

class PokeEmptyMessage extends StatelessWidget {
  final String message;

  const PokeEmptyMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 24.0,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PokemonLogo(
            widthFactor: 1,
            heightFactor: 1,
            iconWidth: 128,
            alignment: Alignment.center,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
