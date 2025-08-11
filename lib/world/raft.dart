import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/painting.dart';
import 'package:flame/components.dart';

/// Komponent reprezentujacy tratwe gracza wraz z logika ruchu.
class Raft extends BodyComponent {
  static const double speed = 200;
  final Paint _paint = Paint()..color = const Color(0xFF964B00);

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2.zero(),
      type: BodyType.dynamic,
      linearDamping: 0.5, // Opór wody
    );
    final fixtureDef = FixtureDef(
      PolygonShape()..setAsBoxXY(20, 20),
      restitution: 0.4,
      density: 1.0,
      friction: 0.2,
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final rect = Rect.fromCenter(center: Offset.zero, width: 40, height: 40);
    canvas.drawRect(rect, _paint);
  }

  void move(Vector2 delta) {
    body.applyLinearImpulse(delta * speed);
  }

  void stop() {
    body.linearVelocity = Vector2.zero();
  }
}
