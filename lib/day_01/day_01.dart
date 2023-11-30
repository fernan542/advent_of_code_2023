import 'package:advent_of_code_2023/day.dart';

const caloriesInput = [
  '1000',
  '2000',
  '3000',
  '',
  '4000',
  '',
  '5000',
  '6000',
  '',
  '7000',
  '8000',
  '9000',
  '',
  '10000',
  '',
  '9999999',
];

class Day01 extends Day<List<int>> {
  Day01({
    super.title = 'Calorie Counting',
  }) {
    logTitle();
  }

  @override
  List<int> execute() {
    final calories = <int>[];

    var tmp = 0;

    for (final calorie in caloriesInput.followedBy(const [''])) {
      if (calorie.isEmpty) {
        if (tmp != 0) calories.add(tmp);
        tmp = 0;
      } else {
        tmp += int.parse(calorie);
      }
    }

    final sortedCalories = [...calories]..sort((a, b) => b.compareTo(a));
    print('Order of Elf to ask:');

    final sb = StringBuffer();
    for (var c = 0; c < sortedCalories.length; c++) {
      final index = calories.indexOf(sortedCalories[c]);
      sb.write('Elf #$index [${sortedCalories[c]}]');

      if (c == 0) {
        sb.write(' - Highest Calories');
      }

      sb.writeln();
    }

    print(sb);
    return sortedCalories;
  }
}
