import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_facts/components/poke_text_field.dart';
import 'package:poke_facts/home/bloc/home_bloc.dart';
import 'package:poke_facts/home/component/home_grid.dart';
import 'package:poke_facts/home/component/pokemon_logo.dart';

import '../navigation/navigation_declaration.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

class HomePage extends StatelessWidget {
  static final String searchTag = 'searchTag';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeLoadEvent()),
      child: BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) =>
            previous.query != current.query && current.query.length > 3,
        listener: (context, state) {
          context.goNamed(
            pageList,
            queryParameters: {
              homePageQueryParam: state.query,
              homePageTagParam: searchTag,
            },
          );
        },
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                PokemonLogo(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    spacing: 24.0,
                    children: [
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (prev, curr) => prev.query != curr.query,
      builder: (context, state) {
        return Hero(
          tag: searchTag,
          child: PokeTextField(
            placeholder: 'Search Pokemon\'s, Moves',
            text: context.read<HomeBloc>().state.query,
            onChanged: (value) =>
                context.read<HomeBloc>().add(QueryChanged(value)),
          ),
        );
      },
    );
  }
}
