import 'day_01/day_01.dart';

void main(List<String> args) {
  if (args.length != 1) {
    print('Usage: <dayNumber>');
    return;
  }

  final day = int.tryParse(args[0]);
  if (day == null) {
    print('Please provide a valid day.');
    return;
  }

  switch (day) {
    case 1:
      Day01().execute();
      break;
    default:
      break;
  }
}
