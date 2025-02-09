import 'package:flutter/material.dart';
import 'package:poke_facts/components/poke_text_field.dart';

class PokeListPage extends StatelessWidget {
  final String query;
  final String tag;

  const PokeListPage({super.key, required this.query, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: tag,
          child: SizedBox(
            height: 40,
            child: PokeTextField(
              text: query,
              placeholder: 'Search Pokemon\'s, Moves',
              onChanged: (value) => {},
            ),
          ),
        ),
      ),
      body: Center(child: Text('Pokemon List Page')),
    );
  }
}
