import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/flame/components/ball.dart';
import 'package:game/flame/components/bat.dart';
import 'package:game/flame/components/play_area.dart';
import 'package:game/flame/utils/config.dart';

import 'dart:math';

import 'components/brick.dart';

class BrickBreaker extends FlameGame
    with HasCollisionDetection, KeyboardEvents {
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
        difficultyModifier: difficultyModifier,
      ),
    );

    world.add(
      Bat(
        cornerRadius: Radius.circular(ballRadius / 2),
        size: Vector2(batWidth, batHeight),
        position: Vector2(width / 2, height * 0.88),
      ),
    );

    addBricks();

    //debugMode = true;
  }

  Future<void> addBricks() async {
    var bricks = <Brick>[];
    for (int i = 0; i < brickColors.length; i++) {
      for (int j = 1; j <= 20; j++) {
        bricks.add(Brick(
          color: brickColors[i],
          position: Vector2(
              (i + 0.5) * brickWidth + (i + 1) * brickGutter,
              (j + 2.0) * brickHeight + j * brickGutter
          )
        ));
      }
    }
    await world.addAll(bricks);
  }

  Vector2 _createBallVelocity() {
    final x = (rand.nextDouble() - 0.5) * width;
    final y = height * 0.2;
    final tempVelocity = Vector2(x, y).normalized();
    return tempVelocity..scale(height / 4);
  }

  //TODO 理解できてないので、要復習
  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    super.onKeyEvent(event, keysPressed);
    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowLeft:
        world.children.query<Bat>().first.moveBy(-batStep);
      case LogicalKeyboardKey.arrowRight:
        world.children.query<Bat>().first.moveBy(batStep);
    }
    return KeyEventResult.handled;
  }

}
