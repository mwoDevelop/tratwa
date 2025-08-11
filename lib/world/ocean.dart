import 'package:flame/components.dart';
import 'package:flutter/painting.dart';

/// Komponent odpowiedzialny za renderowanie oceanu i centralnej wyspy.
class Ocean extends PositionComponent {
  static const double mapRadius = 500;
  static const double islandRadius = 50;

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
