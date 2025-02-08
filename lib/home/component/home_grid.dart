import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_facts/home/component/pokemon_logo.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.gridItems != current.gridItems,
      builder: (context, state) {
        return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2.5,
          children: state.gridItems
              .map((gridItem) => _buildGridItem(context, gridItem))
              .toList(),
        );
      },
    );
  }

  Widget _buildGridItem(BuildContext context, HomeGridItem gridItem) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: gridItem.color,
      child: Stack(
        children: [
          PokemonLogo(
            widthFactor: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                gridItem.text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
