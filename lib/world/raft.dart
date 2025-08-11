import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:flutter/painting.dart';
import 'ocean.dart';

/// Komponent reprezentujacy tratwe gracza wraz z logika ruchu.
class Raft extends PositionComponent with KeyboardHandler {
  static const double speed = 150;
  final Paint _paint = Paint()..color = const Color(0xFF964B00);
  Vector2 velocity = Vector2.zero();

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    final double distance = position.length;
    if (distance > Ocean.mapRadius) {
      position = position.normalized() * Ocean.mapRadius;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final rect = Rect.fromCenter(center: Offset.zero, width: 40, height: 40);
    canvas.drawRect(rect, _paint);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    velocity.setValues(0, 0);
    if (keysPressed.contains(LogicalKeyboardKey.keyW) ||
        keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      velocity.y = -1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyS) ||
        keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      velocity.y = 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      velocity.x = -1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      velocity.x = 1;
    }
    if (velocity.length2 > 0) {
      velocity.normalize();
      velocity *= speed;
    }
    return true;
  }
}
