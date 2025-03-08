import 'package:flutter/material.dart';
import 'package:poke_facts/components/poke_empty_message.dart';
import 'package:poke_facts/components/poke_image.dart';
import 'package:poke_facts/list/bloc/poke_list_state.dart';

class PokeDetailPage extends StatelessWidget {
  final PokeListItem? item;
  final String tag;

  const PokeDetailPage({super.key, required this.item, required this.tag});

  Widget _buildBody(BuildContext context) {
    if (item == null) {
      return const PokeEmptyMessage(message: "No details available");
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(tag: tag, child: PokeImage(url: item?.url ?? '')),
          const SizedBox(height: 16),
          Text(item!.text, style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item?.text ?? "Details")),
      body: _buildBody(context),
    );
  }
}
