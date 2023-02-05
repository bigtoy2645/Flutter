extension NumberParsing on String {
  int? toIntOrNull() => int.tryParse(this);
}

extension IterableX<T extends num> on Iterable<T> {
  T sum() => reduce((value, element) => value + element as T);
}

void main() {
  '123'.toIntOrNull();
  final sum = [1.0, 2.0, 3.0].sum();
  print(sum);
}
