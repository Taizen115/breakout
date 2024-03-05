import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/flame/brick_breaker.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final game = BrickBreaker();
    return Scaffold(
      body: GameWidget(
        game: game
      ),
    );
  }
}