import 'package:flame/game.dart';
import '../world/ocean.dart';
import '../world/raft.dart';
import '../ui/minimap.dart';

/// Glowna klasa gry zarzadzajaca wszystkimi komponentami.
class TratwaGame extends FlameGame {
  late Raft raft;
  late Minimap minimap;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Tlo oceanu i wyspa w centrum.
    add(Ocean());
    // Tratwa gracza
    raft = Raft();
    add(raft);
    // Minimapa w lewym dolnym rogu
    minimap = Minimap(raft: raft);
    add(minimap);
  }

  @override
  void update(double dt) {
    super.update(dt);
    minimap.updatePlayerPosition(raft.position);
  }
}
