import 'package:flutter/material.dart';

enum PokeType {
  normal,
  fire,
  water,
  electric,
  grass,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy,
}

extension PokeTypeIcon on PokeType {
  IconData get icon {
    switch (this) {
      case PokeType.normal:
        return Icons.circle_outlined;
      case PokeType.fire:
        return Icons.local_fire_department;
      case PokeType.water:
        return Icons.water_drop;
      case PokeType.electric:
        return Icons.flash_on;
      case PokeType.grass:
        return Icons.eco;
      case PokeType.ice:
        return Icons.ac_unit;
      case PokeType.fighting:
        return Icons.sports_mma;
      case PokeType.poison:
        return Icons.biotech;
      case PokeType.ground:
        return Icons.terrain;
      case PokeType.flying:
        return Icons.air;
      case PokeType.psychic:
        return Icons.psychology;
      case PokeType.bug:
        return Icons.bug_report;
      case PokeType.rock:
        return Icons.landscape;
      case PokeType.ghost:
        return Icons.nightlight_round;
      case PokeType.dragon:
        return Icons.all_inclusive;
      case PokeType.dark:
        return Icons.dark_mode;
      case PokeType.steel:
        return Icons.build;
      case PokeType.fairy:
        return Icons.auto_awesome;
    }
  }
}
