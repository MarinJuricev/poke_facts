import 'package:flutter/material.dart';
import 'package:poke_facts/core/models/poke_type.dart';

extension PokeTypeColor on PokeType {
  Color get cardColor {
    switch (this) {
      case PokeType.normal:
        return Colors.grey.shade300;
      case PokeType.fire:
        return Colors.red.shade300;
      case PokeType.water:
        return Colors.blue.shade300;
      case PokeType.electric:
        return Colors.yellow.shade300;
      case PokeType.grass:
        return Colors.green.shade300;
      case PokeType.ice:
        return Colors.cyan.shade300;
      case PokeType.fighting:
        return Colors.orange.shade300;
      case PokeType.poison:
        return Colors.purple.shade300;
      case PokeType.ground:
        return Colors.brown.shade300;
      case PokeType.flying:
        return Colors.indigo.shade300;
      case PokeType.psychic:
        return Colors.pink.shade300;
      case PokeType.bug:
        return Colors.lightGreen.shade300;
      case PokeType.rock:
        return Colors.brown.shade400;
      case PokeType.ghost:
        return Colors.deepPurple.shade300;
      case PokeType.dragon:
        return Colors.indigo.shade400;
      case PokeType.dark:
        return Colors.black45;
      case PokeType.steel:
        return Colors.blueGrey.shade300;
      case PokeType.fairy:
        return Colors.pinkAccent.shade100;
    }
  }
}
