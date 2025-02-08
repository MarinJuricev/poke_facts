import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_facts/home/bloc/home_bloc.dart';
import 'package:poke_facts/home/component/home_grid.dart';
import 'package:poke_facts/home/component/pokemon_logo.dart';
import 'package:poke_facts/presentation/images.dart';

import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (_) => HomeBloc()..add(HomeLoadEvent()),
      child: Scaffold(
        body: SafeArea(
          child: Stack(children: [
            PokemonLogo(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(spacing: 24.0, children: [
                SizedBox(height: screenHeight * 0.10),
                Text(
                  'What Pokemon\nare you looking for?',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                _buildSearchField(context),
                Expanded(
                  child: HomeGrid(),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, curr) => prev.query != curr.query,
      builder: (context, state) {
        return CupertinoTextField(
          prefix: Padding(
            padding: const EdgeInsets.only(left: 8, right: 4),
            child: Icon(
              CupertinoIcons.search,
              color: CupertinoColors.systemGrey3,
            ),
          ),
          placeholder: 'Search Pokemon\'s, Moves',
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey5,
            borderRadius: BorderRadius.circular(16),
          ),
          onChanged: (value) =>
              context.read<HomeBloc>().add(QueryChanged(value)),
        );
      },
    );
  }
}
