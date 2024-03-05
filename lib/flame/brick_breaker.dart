import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:game/flame/components/ball.dart';
import 'package:game/flame/components/play_area.dart';
import 'package:game/flame/utils/config.dart';

import 'dart:math';

class BrickBreaker extends FlameGame {
  BrickBreaker()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  double get width => size.x;

  double get height => size.y;

  final rand = Random();

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    camera.viewfinder.anchor = Anchor.topLeft;
    world.add(PlayArea());

    world.add(
      Ball(
          position: size / 2,
          radius: ballRadius,
          velocity: _createBallVelocity(),
      ),
    );

    debugMode = true;
  }

  Vector2 _createBallVelocity() {
    final x = (rand.nextDouble() - 0.5) * width;
    final y = height * 0.2;
    final tempVelocity = Vector2(x, y).normalized();
    return tempVelocity..scale(height / 4);
  }
}
