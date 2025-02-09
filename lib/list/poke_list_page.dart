import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_facts/components/poke_text_field.dart';
import 'package:poke_facts/di.dart';
import 'package:poke_facts/list/bloc/poke_list_bloc.dart';
import 'package:poke_facts/list/bloc/poke_list_event.dart';

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
      body: const Center(child: Text('Pokemon List Page')),
    );
  }
}
