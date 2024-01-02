// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'dart:math';

import 'package:advent_of_code_2023/day.dart';
import 'package:advent_of_code_2023/extensions.dart';

class Day03 extends Day<int> {
  Day03({
    super.title = 'Gear Ratios',
    super.url = 'https://adventofcode.com/2023/day/3',
  }) {
    logTitle();
  }

  @override
  int executeP1() {
    final lines = File('lib/day_03/input_01.txt').readAsLinesSync();
    var answer = 0;

    for (var r = 0; r < lines.length; r++) {
      final row = lines[r].split('');
      for (var c = 0; c < lines[0].length; c++) {
        final col = row[c];
        if (!col.isDigit) continue;

        final value = row.toLastDigit(c);
        final left = c - 1 > -1 ? c - 1 : c;
        final right = min(c + value.length + 1, lines[0].length);

        final toAdd = [
          // Top line.
          if (r != 0) ...lines[r - 1].split('').sublist(left, right),
          // Mid line.
          ...lines[r].split('').sublist(left, right),
          // Bottom line.
          if (r != lines.length - 1)
            ...lines[r + 1].split('').sublist(left, right),
        ].join().containsSymbol();

        if (toAdd) answer += int.parse(value);
        c += value.length;
      }
    }

    return answer;
  }

  @override
  int executeP2() {
    final lines = File('lib/day_03/input_01.txt').readAsLinesSync();

    final ratios = <int>[];
    for (var r = 0; r < lines.length; r++) {
      final row = lines[r].split('');

      for (var c = 0; c < lines[0].length; c++) {
        final col = row[c];
        if (!col.isStar) continue;

        final gears = <int>[];
        final left = c - 1 > -1 ? c - 1 : c;
        final right = min(c + 1, lines[0].length);
        final numbers = <List<String>>[
          [if (r != 0) ...lines[r - 1].split('')],
          [...lines[r].split('')],
          [if (r != lines.length - 1) ...lines[r + 1].split('')],
        ];

        for (final n in numbers) {
          final temp = int.tryParse(n.toFullDigit(left, right));
          if (temp != null) gears.add(temp);
        }

        if (gears.length >= 2) {
          ratios.add(
            gears.fold(1, (total, part) => part != null ? part * total : total),
          );
        }
      }
    }

    return ratios.fold(0, (total, ratio) => total + ratio);
  }
}
