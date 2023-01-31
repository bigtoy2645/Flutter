extension Range on int {
  List<int> rangeTo(int other) {
    if (this > other) {
      return [];
    }
    final items = <int>[];
    for (var i = this; i <= other; i++) {
      items.add(i);
    }
    return items;
  }
}

void main() {
  for (var i in 2.rangeTo(3)) {
    print(i);
  }
}
