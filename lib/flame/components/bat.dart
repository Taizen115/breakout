import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:game/flame/brick_breaker.dart';
import 'package:game/flame/utils/config.dart';

class Bat extends PositionComponent
    with HasGameReference<BrickBreaker>, DragCallbacks {
  final Radius cornerRadius;

  Bat({
    required this.cornerRadius,
    required super.position,
    required super.size,
  }) : super(
          anchor: Anchor.center,
          children: [RectangleHitbox()],
        );

  final _paint = Paint()
    ..color = Color(0xffbf783a)
    ..style = PaintingStyle.fill;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size.toSize(), cornerRadius),
      _paint,
    );
  }
  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    position.x = (position.x + event.localDelta.x).clamp(0 + width / 2, gameWidth - width / 2);
  }

  void moveBy(double dx) {
    add(
      MoveToEffect(
      Vector2(
        //TODO
        (position.x + dx).clamp(0 + width / 2, gameWidth - width / 2),
        position.y,
      ),
        EffectController(duration: 0.1),
    ),
    );
  }
}
