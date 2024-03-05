import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Ball extends CircleComponent {
  final Vector2 velocity;

  Ball({
    required super.position,
    required double radius,
    required this.velocity,
  }) : super(
          anchor: Anchor.center,
          radius: radius,
          paint: Paint()
            ..color = Colors.white70
            ..style = PaintingStyle.fill,
        );
  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
  }
}
