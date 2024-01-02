import 'dart:io';

import 'package:advent_of_code_2023/day.dart';

enum Cube {
  green(limit: 13),
  red(limit: 12),
  blue(limit: 14);

  const Cube({
    required this.limit,
  });

  final int limit;

  bool hasExceed(int value) => value > limit;
}

class Day02 extends Day<int> {
  Day02({
    super.title = 'Cube Conundrum',
    super.url = 'https://adventofcode.com/2023/day/2',
  }) {
    logTitle();
  }

  @override
  int executeP1() {
    final lines = File('lib/day_02/input_01.txt').readAsLinesSync();
    var answer = 0;

    for (var l = 0; l < lines.length; l++) {
      final game = lines[l].replaceAll(' ', '');
      final sets = game.split(':')[1].split(';');
      var exceed = false;

      for (final set in sets) {
        final cubes = set.split(',');
        for (final cube in cubes) {
          final count = int.parse(cube.replaceAll(RegExp('[A-Za-z]'), ''));
          final c = cube.replaceAll(RegExp(r'\d'), '');
          final color = Cube.values.byName(c);

          if (color.hasExceed(count)) {
            exceed = true;
            continue;
          }
        }
      }

      if (exceed) {
        exceed = false;
        continue;
      }

      answer += l + 1;
    }

    return answer;
  }

  @override
  int executeP2() {
    final lines = File('lib/day_02/input_01.txt').readAsLinesSync();
    var answer = 0;

    for (var l = 0; l < lines.length; l++) {
      final game = lines[l].replaceAll(' ', '');
      final sets = game.split(':')[1].split(';');
      int? red;
      int? blue;
      int? green;

      for (final set in sets) {
        final cubes = set.split(',');
        for (final cube in cubes) {
          final count = int.parse(cube.replaceAll(RegExp('[A-Za-z]'), ''));
          final c = cube.replaceAll(RegExp(r'\d'), '');
          final color = Cube.values.byName(c);

          switch (color) {
            case Cube.blue:
              blue ??= count;
              if (count > blue) blue = count;
              break;
            case Cube.green:
              green ??= count;
              if (count > green) green = count;
              break;
            case Cube.red:
              red ??= count;
              if (count > red) red = count;
              break;
          }
        }
      }

      answer += (green ?? 1) * (red ?? 1) * (blue ?? 1);
    }

    return answer;
  }
}
