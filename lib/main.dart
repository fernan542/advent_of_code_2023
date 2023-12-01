import 'day_01/day_01.dart';

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
      Day01().executeP1();
    } else {
      Day01().executeP2();
    }
  }
}
