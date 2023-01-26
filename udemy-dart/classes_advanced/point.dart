import 'package:equatable/equatable.dart';

class Point extends Equatable {
  Point(this.x, this.y);
  final int x;
  final int y;

  @override
  List<Object?> get props => [x, y];

  @override
  bool get stringify => true;

  // @override
  // String toString() => 'Point($x, $y)';
  //
  // @override
  // bool operator ==(Object other) {
  //   if (other is Point) {
  //     return this.x == other.x && this.y == other.y;
  //   }
  //   return false;
  // }
  //
  // @override
  // bool operator ==(covariant Point other) {
  //   return this.x == other.x && this.y == other.y;
  // }

  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }

  Point operator *(int other) {
    return Point(x + other, y + other);
  }
}

void main() {
  print(Point(0, 0) == Point(0, 0));
  print(Point(0, 0) == Point(0, 1));
}
