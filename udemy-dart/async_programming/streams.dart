Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}

/// Stream.reduce = 각 요소가 작업이 끝날때 까지 대기함.
Future<int> sumStream2(Stream<int> stream) =>
    stream.reduce((previous, element) => previous + element);

Stream<int> countStream(int n) async* {
  for (var i = 1; i <= n; i++) {
    yield i;
  }
}

Iterable<int> count(int n) sync* {
  for (var i = 1; i <= n; i++) {
    yield i;
  }
}

Future<void> main() async {
  final stream = Stream<int>.fromIterable([1, 2, 3, 4]);
  final stream2 = countStream(4);
  final sum = await sumStream(stream2);
  print('Sum: $sum');
}
