abstract class InterfaceA {
  void a();
}

abstract class InterfaceB {
  void b();
}

class AB implements InterfaceA, InterfaceB {
  @override
  void a() {
    // TODO: implement a
  }

  @override
  void b() {
    // TODO: implement b
  }
}

abstract class Base {
  void foo();
  void bar() => print('bar');
}

class Subclass implements Base {
  @override
  void foo() {
    // TODO: implement foo
  }

  @override
  void bar() {
    // TODO: implement bar
  }
}
