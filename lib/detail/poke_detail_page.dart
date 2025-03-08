import 'package:flutter/material.dart';
import 'package:poke_facts/list/bloc/poke_list_state.dart';

class PokeDetailPage extends StatelessWidget {
  final PokeListItem item;

  const PokeDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(item.text)));
  }
}
