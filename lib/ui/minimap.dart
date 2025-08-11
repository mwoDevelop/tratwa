import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/painting.dart';
import '../world/raft.dart';
import '../world/ocean.dart';

/// Prosty komponent minimapy wyswietlany w lewym dolnym rogu ekranu.
class Minimap extends PositionComponent {
  final Raft raft;
  final double mapScale;
  Minimap({required this.raft, this.mapScale = 0.1}) {
    position = Vector2.all(20);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paintBg = Paint()..color = const Color(0x88000000);
    const double size = 100;
    canvas.drawRect(const Rect.fromLTWH(0, 0, size, size), paintBg);
    // Wyspa w centrum
    const center = Offset(size / 2, size / 2);
    canvas.drawCircle(
        center, Ocean.islandRadius * mapScale, BasicPalette.green.paint());
    // Pozycja tratwy
    final player = center +
        Offset(raft.body.position.x * mapScale, raft.body.position.y * mapScale);
    canvas.drawCircle(player, 2, BasicPalette.red.paint());
  }
}
