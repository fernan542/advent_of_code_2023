abstract class Day<A> {
  const Day({
    required this.title,
    required this.url,
  });

  A executeP1();
  A executeP2();
  final String title;
  final String url;

  void logP1Answer() => print('Part 01 Answer: ${executeP1()}');
  void logP2Answer() => print('Part 02 Answer: ${executeP2()}');
  void logTitle() => print('🎄 $title 🎄\nLink: $url\n');
}
