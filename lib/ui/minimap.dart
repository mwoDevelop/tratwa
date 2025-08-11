import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/painting.dart';
import '../world/raft.dart';
import '../world/ocean.dart';

/// Prosty komponent minimapy wyswietlany w lewym dolnym rogu ekranu.
class Minimap extends PositionComponent {
  final Raft raft;
  final double scale;
  Minimap({required this.raft, this.scale = 0.1}) {
    position = Vector2.all(20);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paintBg = Paint()..color = const Color(0x88000000);
    const double size = 100;
    canvas.drawRect(Rect.fromLTWH(0, 0, size, size), paintBg);
    // Wyspa w centrum
    final center = Offset(size / 2, size / 2);
    canvas.drawCircle(center, Ocean.islandRadius * scale, BasicPalette.green.paint());
    // Pozycja tratwy
    final player = center + Offset(raft.position.x * scale, raft.position.y * scale);
    canvas.drawCircle(player, 2, BasicPalette.red.paint());
  }

  void updatePlayerPosition(Vector2 pos) {
    // Metoda zachowana dla zgodnosci; aktualizacja wykonywana w render.
  }
}
