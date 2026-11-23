import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_doner_dunya/oyun_doner_dunya.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(donerDunyaConfig.title.length, 33);
    expect(donerDunyaConfig.tagline.length, 33);
    for (final s in donerDunyaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(donerDunyaConfig.gameId, donerDunyaId);
    expect(donerDunyaRules.gameId, donerDunyaId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(donerDunyaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: donerDunyaId, optionalMechanics: donerDunyaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(donerDunyaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
