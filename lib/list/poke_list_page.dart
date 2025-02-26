import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_facts/components/poke_text_field.dart';
import 'package:poke_facts/di.dart';
import 'package:poke_facts/list/bloc/poke_list_bloc.dart';
import 'package:poke_facts/list/bloc/poke_list_event.dart';
import 'package:poke_facts/list/bloc/poke_list_state.dart';

class PokeListPage extends StatelessWidget {
  final String query;
  final String tag;

  const PokeListPage({
    super.key,
    required this.query,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PokeListBloc>()..add(OnLoad(query)),
      child: PokeListContent(tag: tag, query: query),
    );
  }
}

class PokeListContent extends StatelessWidget {
  final String tag;
  final String query;

  const PokeListContent({
    super.key,
    required this.tag,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PokeListBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: tag,
          child: SizedBox(
            height: 40,
            child: PokeTextField(
              text: context.watch<PokeListBloc>().state.query ?? query,
              placeholder: 'Search Pokemon\'s, Moves',
              onChanged: (value) =>
                  context.read<PokeListBloc>().add(PokeListQueryChanged(value)),
            ),
          ),
        ),
      ),
      body: state.errorMessage != null
          ? Center(child: Text('Error: ${state.errorMessage}'))
          : _PokemonListGrid(items: state.items),
    );
  }
}

class _PokemonListGrid extends StatelessWidget {
  const _PokemonListGrid({required this.items});
  final List<PokeListItem> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          color: item.color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text('Height: ${item.height}'),
                Text('Weight: ${item.weight}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
