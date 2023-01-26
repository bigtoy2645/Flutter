import 'dart:math';

abstract class Shape {
  double get area;
  double get perimeter;

  void printValues() {
    print('area is $area, perimeter is $perimeter');
  }

  const Shape();
  factory Shape.fromJson(Map<String, Object> json) {
    final type = json['type'];
    switch (type) {
      case 'square':
        final side = json['side'];
        if (side is double) {
          return Square(side);
        }
        throw UnsupportedError('invalid or missing side property');
      case 'circle':
        final radius = json['radius'];
        if (radius is double) {
          return Circle(radius);
        }
        throw UnsupportedError('invalid or missing radius property');
      default:
        throw UnsupportedError('sjape $type not recognized');
    }
  }
}

class Square extends Shape {
  Square(this.side);
  final double side;

  @override
  double get area => side * side;
  double get perimeter => 4 * side;
}

class Circle extends Shape {
  Circle(this.radius);
  final double radius;

  @override
  double get area => pi * radius * radius;
  double get perimeter => 2 * pi * radius;
}

void printArea(Shape shape) {
  print(shape.area);
}

void main() {
  final shapes = [
    Square(10),
    Circle(10),
  ];

  shapes.forEach((element) {
    element.printValues();
  });

  final shapesJson = [
    {
      'type': 'square',
      'side': 10.0,
    },
    {
      'type': 'circle',
      'radius': 5.0,
    }
  ];
  final shapesFromJson = shapesJson.map((e) => Shape.fromJson(e));
  shapesFromJson.forEach((element) {
    element.printValues();
  });
}
