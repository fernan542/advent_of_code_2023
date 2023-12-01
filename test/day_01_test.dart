import 'package:advent_of_code_2023/day_01/day_01.dart';
import 'package:test/test.dart';

void main() {
  group('Day 01', () {
    test('sum of all of the calibration values part 1.', () {
      expect(
        Day01().executeP1(),
        equals(54390),
      );
    });

    test('sum of all of the calibration values part 2.', () {
      expect(
        Day01().executeP2(),
        equals(54277),
      );
    });
  });
}
