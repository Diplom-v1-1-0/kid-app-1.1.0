import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

enum Level { Hard, Medium, Easy }

List<String> fillSourceArray() {
  return [
    'assets/images/deer.svg',
    'assets/images/deer.svg',
    'assets/images/dog.svg',
    'assets/images/dog.svg',
    'assets/images/cat.svg',
    'assets/images/cat.svg',
    'assets/images/kangaroo.svg',
    'assets/images/kangaroo.svg',
    'assets/images/butterfly.svg',
    'assets/images/butterfly.svg',
    'assets/images/fish.svg',
    'assets/images/fish.svg',
    'assets/images/fox.svg',
    'assets/images/fox.svg',
    'assets/images/elephant.svg',
    'assets/images/elephant.svg',
    'assets/images/girrafe.svg',
    'assets/images/girrafe.svg',
  ];
}

List<String> getSourceArray(Level level) {
  List<String> levelAndKindList = [];
  List<String> sourceArray = fillSourceArray();

  if (level == Level.Hard) {
    levelAndKindList.addAll(sourceArray);
  } else if (level == Level.Medium) {
    levelAndKindList.addAll(sourceArray.take(12));
  } else if (level == Level.Easy) {
    levelAndKindList.addAll(sourceArray.take(6));
  }

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState(Level level) {
  List<bool> initialItemState = [];

  if (level == Level.Hard) {
    for (int i = 0; i < 18; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      initialItemState.add(true);
    }
  }

  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];

  if (level == Level.Hard) {
    for (int i = 0; i < 18; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }

  return cardStateKeys;
}
