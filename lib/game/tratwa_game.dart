import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

import '../world/ocean.dart';
import '../world/raft.dart';
import '../ui/minimap.dart';

/// Glowna klasa gry zarzadzajaca wszystkimi komponentami.
class TratwaGame extends Forge2DGame {
  late Raft raft;
  late Minimap minimap;
  late final JoystickComponent joystick;

  TratwaGame() : super(zoom: 1.0, gravity: Vector2.zero());

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Tlo oceanu i wyspa w centrum.
    add(Ocean());
    // Tratwa gracza
    raft = Raft();
    add(raft);

    // Joystick
    final joystickKnobPaint = Paint()..color = Colors.grey.withOpacity(0.5);
    final joystickBackgroundPaint = Paint()..color = Colors.grey.withOpacity(0.2);
    joystick = JoystickComponent(
      knob: CircleComponent(radius: 30, paint: joystickKnobPaint),
      background: CircleComponent(radius: 70, paint: joystickBackgroundPaint),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    final camera = CameraComponent.withFixedResolution(width: 800, height: 600);
    camera.follow(raft);
    add(camera);

    // Dodanie joysticka i minimapy do kamery, aby były one statyczne na ekranie
    camera.viewport.add(joystick);
    minimap = Minimap(raft: raft);
    camera.viewport.add(minimap);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (raft.isMounted) {
      if (!joystick.delta.isZero()) {
        raft.move(joystick.delta);
      } else {
        raft.stop();
      }
    }
  }
}
