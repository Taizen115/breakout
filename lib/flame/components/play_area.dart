import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/painting.dart';

import '../brick_breaker.dart';

class PlayArea extends RectangleComponent with HasGameReference<BrickBreaker> {
  PlayArea():super(
    paint: Paint()..color = const Color(0xff87ceeb)
  );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.width, game.height);
  }
}