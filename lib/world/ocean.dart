import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/painting.dart';
import 'package:flame/components.dart';

/// Komponent odpowiedzialny za renderowanie oceanu i centralnej wyspy.
class Ocean extends BodyComponent {
  static const double mapRadius = 500;
  static const double islandRadius = 50;

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2.zero(),
      type: BodyType.static,
    );
    final islandFixture = FixtureDef(
      CircleShape()..radius = islandRadius,
    );
    // Granica oceanu
    final oceanFixture = FixtureDef(
      ChainShape()
        ..createLoop(
          [
            Vector2(mapRadius, mapRadius),
            Vector2(-mapRadius, mapRadius),
            Vector2(-mapRadius, -mapRadius),
            Vector2(mapRadius, -mapRadius),
          ],
        ),
    );
    return world.createBody(bodyDef)
      ..createFixture(islandFixture)
      ..createFixture(oceanFixture);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final center = Vector2.zero();
    final paintOcean = Paint()..color = const Color(0xFF0066CC);
    canvas.drawCircle(center.toOffset(), mapRadius, paintOcean);

    final paintIsland = Paint()..color = const Color(0xFF228B22);
    canvas.drawCircle(center.toOffset(), islandRadius, paintIsland);
  }
}
