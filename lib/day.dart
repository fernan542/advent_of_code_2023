abstract class Day<A> {
  const Day({
    required this.title,
    required this.url,
  });

  A executeP1();
  A executeP2();
  final String title;
  final String url;

  void logTitle() => print('# $title #\n$url\n');
}
