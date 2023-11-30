import 'package:advent_of_code_2023/day_01/day_01.dart';
import 'package:test/test.dart';

void main() {
  group('Day 01', () {
    test('Returns sorted list of calories.', () {
      expect(
        Day01().execute(),
        equals(
          [9999999, 24000, 11000, 10000, 6000, 4000],
        ),
      );
    });
  });
}
