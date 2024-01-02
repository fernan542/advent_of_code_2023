extension StringX on String {
  String get firstThree => '${this[0]}${this[1]}${this[2]}';

  bool containsSymbol() => RegExp(r'[^\w\s.]').hasMatch(this);

  int? removeSymbols() => int.tryParse(
        replaceAll(RegExp(r'[^\w\s]'), ''),
      );

  bool get isDigit => int.tryParse(this) != null;

  bool get isStar => this == '*';
}

extension ListX<T> on List<T> {
  String toLastDigit(int start) {
    var s = '';
    for (var i = start; i < length; i++) {
      if (!this[i].toString().isDigit) return s;
      s = '$s${this[i]}';
    }

    print(s);

    return s;
  }

  String toFullDigit(int left, int right) {
    var s = '';
    // print('this: $this');
    // to the left.
    if (left != 0) {
      for (var i = left; i >= 0; i--) {
        if (!this[i].toString().isDigit) break;
        s = '${this[i]}$s';
      }
    }

    // to the right.
    for (var i = left + 1; i < length; i++) {
      if (!this[i].toString().isDigit) {
        if (s.isNotEmpty) return s;
        if (i > right) return s;
        continue;
      }
      s = '$s${this[i]}';
    }

    return s;
  }
}
