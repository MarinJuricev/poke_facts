import 'package:flutter/material.dart';
import 'package:poke_facts/components/poke_empty_message.dart';
import 'package:poke_facts/components/poke_image.dart';
import 'package:poke_facts/core/ext/string_ext.dart';
import 'package:poke_facts/list/bloc/poke_list_state.dart';

class PokeDetailPage extends StatelessWidget {
  final PokeListItem? item;
  final String tag;

  const PokeDetailPage({super.key, required this.item, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    final currentItem = item;

    if (currentItem == null) {
      return const PokeEmptyMessage(message: "No details available");
    }
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentItem.text.capitalize(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  '#${currentItem.id}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          Hero(
            tag: tag,
            child: PokeImage(url: currentItem.url, width: 256, height: 256),
          ),
          const SizedBox(height: 16),
          Text(
            currentItem.text,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
