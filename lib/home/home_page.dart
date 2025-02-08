import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_facts/presentation/images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          _pokemonLogo(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(spacing: 24.0, children: [
              SizedBox(height: 48),
              Text(
                'What Pokemon\nare you looking for?',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              CupertinoTextField(
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 4),
                  child: Icon(
                    CupertinoIcons.search,
                    color: CupertinoColors.systemGrey3,
                  ),
                ),
                placeholder: 'Search Pokemons, Moves',
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey5,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.5,
                  children: [
                    _buildGridItem(context, 'Pokedex'),
                    _buildGridItem(context, 'Moves'),
                    _buildGridItem(context, 'Abilities'),
                    _buildGridItem(context, 'Items'),
                    _buildGridItem(context, 'Locations'),
                    _buildGridItem(context, 'Type Effects'),
                  ],
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _pokemonLogo(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.topRight,
      child: ClipRect(
        child: Align(
          alignment: Alignment.bottomLeft,
          widthFactor: 0.65,
          heightFactor: 0.65,
          child: Image.asset(
            AppAssets.pokeball,
            width: screenWidth * 0.65,
            color: Colors.grey.withValues(alpha: 0.15),
            colorBlendMode: BlendMode.modulate,
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ),
    );
  }
}
