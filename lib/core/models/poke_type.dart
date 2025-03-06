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

extension PokeTypeAsset on PokeType {
  String get assetPath {
    switch (this) {
      case PokeType.normal:
        return 'assets/images/types/normal.svg';
      case PokeType.fire:
        return 'assets/images/types/fire.svg';
      case PokeType.water:
        return 'assets/images/types/water.svg';
      case PokeType.electric:
        return 'assets/images/types/electric.svg';
      case PokeType.grass:
        return 'assets/images/types/grass.svg';
      case PokeType.ice:
        return 'assets/images/types/ice.svg';
      case PokeType.fighting:
        return 'assets/images/types/fighting.svg';
      case PokeType.poison:
        return 'assets/images/types/poison.svg';
      case PokeType.ground:
        return 'assets/images/types/ground.svg';
      case PokeType.flying:
        return 'assets/images/types/flying.svg';
      case PokeType.psychic:
        return 'assets/images/types/psychic.svg';
      case PokeType.bug:
        return 'assets/images/types/bug.svg';
      case PokeType.rock:
        return 'assets/images/types/rock.svg';
      case PokeType.ghost:
        return 'assets/images/types/ghost.svg';
      case PokeType.dragon:
        return 'assets/images/types/dragon.svg';
      case PokeType.dark:
        return 'assets/images/types/dark.svg';
      case PokeType.steel:
        return 'assets/images/types/steel.svg';
      case PokeType.fairy:
        return 'assets/images/types/fairy.svg';
    }
  }
}
