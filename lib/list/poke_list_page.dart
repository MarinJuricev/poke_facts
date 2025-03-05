import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_facts/components/poke_image.dart';
import 'package:poke_facts/components/poke_text_field.dart';
import 'package:poke_facts/di.dart';
import 'package:poke_facts/list/bloc/poke_list_bloc.dart';
import 'package:poke_facts/list/bloc/poke_list_event.dart';
import 'package:poke_facts/list/bloc/poke_list_state.dart';

class PokeListPage extends StatelessWidget {
  final String query;
  final String tag;

  const PokeListPage({super.key, required this.query, required this.tag});

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

  const PokeListContent({super.key, required this.tag, required this.query});

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
              onChanged:
                  (value) => context.read<PokeListBloc>().add(
                    PokeListQueryChanged(value),
                  ),
            ),
          ),
        ),
      ),
      body:
          state.errorMessage != null
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
    return AnimatedListView(
      items: items,
      itemBuilder: (context, index) {
        final item = items[index];
        return PokeListImem(item: item, key: ValueKey(item.text));
      },
      isSameItem: (oldItem, newItem) => oldItem.text == newItem.text,
    );
  }
}

class PokeListImem extends StatelessWidget {
  const PokeListImem({super.key, required this.item});

  final PokeListItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item.color,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            PokeImage(url: ''),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Text('ID: ${item.id}'),
                  // Text('Type: ${item.type ?? "Unknown"}'),
                  Text('Height: ${item.height}'),
                  Text('Weight: ${item.weight}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
