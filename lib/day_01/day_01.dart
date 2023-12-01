import 'dart:io';

import 'package:advent_of_code_2023/day.dart';
import 'package:advent_of_code_2023/extensions.dart';

class Day01 extends Day<int> {
  Day01({
    super.title = 'Trebuchet?!',
    super.url = 'https://adventofcode.com/2023/day/1',
  }) {
    logTitle();
  }

  @override
  int executeP1() {
    final lines = File('lib/day_01/input_01.txt').readAsLinesSync();
    final answer = lines.fold(
      0,
      (calibration, line) {
        final nums = line.replaceAll(RegExp('[A-Za-z]'), '');
        final left = nums[0];
        final right = nums[nums.length - 1];
        return calibration += int.parse('$left$right');
      },
    );

    print(answer);
    return answer;
  }

  final _numbersWord = <String>[
    'zero',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
  ];

  @override
  int executeP2() {
    final lines = File('lib/day_01/input_01.txt').readAsLinesSync();
    final answer = lines.fold(
      0,
      (calibration, line) {
        String? left;
        String? right;

        for (var lineChar = 0; lineChar < line.length; lineChar++) {
          if (int.tryParse(line[lineChar]) != null && left == null) {
            left = line[lineChar];
          }

          if (lineChar + 2 < line.length) {
            for (var w = 0; w < _numbersWord.length; w++) {
              final lineFirstThree =
                  '${line[lineChar]}${line[lineChar + 1]}${line[lineChar + 2]}';

              if (_numbersWord[w].firstThree == lineFirstThree) {
                if (left == null) {
                  left = '$w';
                } else {
                  right = '$w';
                }

                continue;
              }
            }
          }

          if (int.tryParse(line[lineChar]) != null) right = line[lineChar];
        }
        return calibration += int.parse('$left$right');
      },
    );

    print(answer);
    return answer;
  }
}
