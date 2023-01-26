class Animal {
  const Animal({required this.age});
  final int age;

  void sleep() => print('sleep');
}

/// Dog IS-A animal
class Dog extends Animal {
  Dog({required int age}) : super(age: age);

  void bark() => print('bark');
}

/// Cow IS-A animal
class Cow extends Animal {
  Cow({required int age}) : super(age: age);

  void moo() => print('moo');
}

/// CleverDog IS-A dog
class CleverDog extends Dog {
  CleverDog({required int age}) : super(age: age);

  void catchBall() => print('catch');
}

void main() {
  final animal = Animal(age: 20);
  animal.sleep();
  final dog = Dog(age: 10);
  dog.bark();
  dog.sleep();
}
