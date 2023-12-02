import 'package:advent_of_code_2023/day_01/day_01.dart';
import 'package:advent_of_code_2023/day_02/day_02.dart';

void main(List<String> args) {
  if (args.length != 2) {
    print('Usage: <dayNumber> <part>');
    return;
  }

  final day = int.tryParse(args[0]);
  if (day == null) {
    print('Please provide a valid day.');
    return;
  }

  final part = int.tryParse(args[1]) ?? 1;

  if (day == 1) {
    if (part == 1) {
      Day01().logP1Answer();
    } else {
      Day01().logP2Answer();
    }
  }

  if (day == 2) {
    if (part == 1) {
      Day02().logP1Answer();
    } else {
      Day02().logP2Answer();
    }
  }
}
