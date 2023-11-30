abstract class Day<R> {
  const Day({
    required this.title,
  });

  R execute();
  final String title;

  void logTitle() => print('# $title #\n');
}
