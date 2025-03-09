import 'package:flutter/material.dart';
import 'package:poke_facts/components/poke_empty_message.dart';
import 'package:poke_facts/components/poke_image.dart';
import 'package:poke_facts/core/ext/string_ext.dart';
import 'package:poke_facts/home/component/pokemon_logo.dart';
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

    return Column(
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
        _PokemonDetailImage(tag: tag, currentItem: currentItem),
      ],
    );
  }
}

class _PokemonDetailImage extends StatelessWidget {
  const _PokemonDetailImage({required this.tag, required this.currentItem});

  final String tag;
  final PokeListItem currentItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        RotatingPokemonLogo(
          alignment: Alignment.center,
          widthFactor: 1.0,
          heightFactor: 1.0,
        ),
        Hero(
          tag: tag,
          child: PokeImage(url: currentItem.url, width: 256, height: 256),
        ),
      ],
    );
  }
}

class RotatingPokemonLogo extends StatefulWidget {
  final Alignment alignment;
  final double widthFactor;
  final double heightFactor;

  const RotatingPokemonLogo({
    super.key,
    this.alignment = Alignment.center,
    this.widthFactor = 1.0,
    this.heightFactor = 1.0,
  });

  @override
  State<RotatingPokemonLogo> createState() => _RotatingPokemonLogoState();
}

class _RotatingPokemonLogoState extends State<RotatingPokemonLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: PokemonLogo(
        alignment: widget.alignment,
        widthFactor: widget.widthFactor,
        heightFactor: widget.heightFactor,
      ),
    );
  }
}
