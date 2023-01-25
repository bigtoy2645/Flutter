# The Complete Dart Language Guide for Beginners and Beyond

강의 : https://www.udemy.com/course/complete-dart-guide/learn/lecture/22036274?start=15#overview  
소스 : https://github.com/bizz84/dart-course-materials   
연습 : https://dartpad.dev/

<details>
<summary>Chapter 1. Dart Basics</summary>

## Dart에 대하여  
  
Code > **Compilation** > APK,IPA,EXE,JS > **Execution**  

- Debug 모드 Just-in-time : Compile 빠름, Execution 느림
- Release 모드 Ahead-of-time : Compile 느림, Execution 빠름
  
### Dart 특징
- Flexible : 여러 플랫폼을 컴파일할 수 있음.
- Productive : Hot Reload가 가능함.
- Fast : 릴리즈 모드 컴파일 시 빠른 실행에 최적화되어있음.
- Object Oriented : 클래스 기반 구현
- Statically typed : 타입을 컴파일 단계에서 체크하여 안전함.
  - Static : 컴파일 시 타입 체크 e.g. Swift, Kotlin, Dart
  - Dynamic : 실행 중 타입 체크 e.g. JavaScript, Python
- C-Style Syntax : Java, Javascript와 유사하여 배우기 쉬움.

#### 사용 예제
```dart
void main() {
  String firstName = 'Andrea';
  String lastName = 'Bizzotto';
  int age = 36;
  double height = 1.84;
  
  print("My name is " + firstName + " " + lastName);
  print("My name is $firstName $lastName");
  print("Next year I will be ${age + 1} years old");
  
  print(r"C:\Windows\system32");  // \가 그대로 출력됨.
  print('Dart course'.toUpperCase());
  print('Dart course'.toLowerCase());
  print('I love pizza'.contains('pizza'));
  print('I love pizza'.replaceAll('pizza', 'pasta'));
}
```
#### 타입 변환
```dart
void main() {
  // int -> String
  int age = 36;
  String ageString = age.toString();
  // double -> String
  double height = 1.84;
  String heightString = height.toStringAsFixed(1);
  // String -> double
  String ratingString = '4.5';
  double rating = double.parse(ratingString);
  // int -> double
  int x = 10;
  double y = x.toDouble();
}
```
#### 주석
```dart
/// The entry point of our program
void main() {
  // print('Program started');
  // TODO: Imcrement to 1.5 once feature X is added
  /*
   * Version 1.5 will include: 
   * - user authentication with Firebase
   * - generate reports
   * /
}
```  

#### 타입 키워드
- var : read-write 변수를 나타내는 키워드
- final : read-only 변수를 나타내는 키워드. 계산하여 값을 초기화할 수 있음.
- const : 컴파일 시 지정되는 상수를 나타내는 키워드. 사용 시 최적화됨. 계산하여 값을 초기화할 수 없음.
- dynamic : 어느 타입이나 될 수 있음.

#### Switch + Enumeration
```dart
enum Operation { plus, minus, multiply, divide }

void main() {
  const a = 4;
  const b = 2;
  const op = Operation.plus;
  
  switch (op) {
    case Operation.plus:
      print('$a + $b = ${a + b}');
      break;
    case Operation.minus:
      print('$a - $b = ${a - b}');
      break;
    case Operation.multiply:
      print('$a * $b = ${a * b}');
      break;
    case Operation.divide:
      print('$a / $b = ${a / b}');
      break;
  }
}
```  
</details>

<details>
<summary>Chapter 2. Collections, Null safety, Functions</summary>

## Collections

### List (Array)
- 중복된 값을 포함할 수 있는 Collection
- 대괄호 []로 초기화한다.

```dart
void main() {
  var cities = ['London', 'Paris', 'Moscow'];

  // for문
  for (var i = 0; i < cities.length; i++) {
    print(cities[i]);
  }
  
  // for-in문
  for (var city in cities) {
    print(city);
  }
 
  // forEach
  cities.forEach(print);
}
```

```dart
void main() {
  var cities = ['London', 'Paris', 'Moscow'];
  
  // <String> : Type Annotation (Optional)
  var cities2 = <String>['London', 'Paris', 'Moscow'];
  List<String> cities3 = ['London', 'Paris', 'Moscow'];
  
  // List 조회
  print(cities.length);
  print(cities.isEmpty);
  print(cities.isNotEmpty);
  print(cities.first);
  print(cities.last);
  print(cities.indexOf('London'));
  print(cities.contains('London'));
  
  // List 수정
  cities.insert(1, 'Tokyo');
  cities.add('Seoul');
  cities.removeAt(2);
  cities.clear();
}
```

### Set
- 고유 값으로 이뤄진 Collection
- Union, Intersection, Difference 함수 사용 가능
- 중괄호 {}로 초기화한다.

```dart
void main() {
  var countries = {'Italy', 'UK', 'Russia'};
  
  // Set 조회
  print(countries.elementAt(0));
  print(countries.first);
  print(countries.last);
  print(countries.length);
  
  // Set 수정
  countries.add('Korea');
  countries.remove('Italy');
}
```
```dart
void main() {
  var euCountries = {'Italy', 'UK', 'Russia'};
  var asianCountries = {'India', 'China', 'Russia'};

  // Union 합집합
  // {Italy, UK, Russia, India, China}
  print(euCountries.union(asianCountries));

  // Intersection 교집합
  // {Russia}
  print(euCountries.intersection(asianCountries));

  // Difference 차집합
  // {Italy, UK}
  print(euCountries.difference(asianCountries));
}
```

### Map (Dictionary)
- Key-value Collection
- 중괄호 {}와 :로 Key-value를 초기화한다.

```dart
void main() {
  Map<String, dynamic> person = {
    'name': 'Andrea',
    'age': 36,
    'height': 1.84,
  };
  var name = person['name'] as String;
  
  print(name);
  
  // Interable은 순차적으로 접근할 수 있는 Collection 아이템
  // List, Set 가능, Map 불가능
  for (var key in person.keys) {
    print(key);
  }
  for (var value in person.values) {
    print(value);
  }
  for (var entry in person.entries) {
    print('${entry.key} : ${entry.value}');
  }
}
```
### Collection Statements and operators
- Collection-if, Collection-for, Spreads
```dart
void main() {
  const addBlue = false;
  const addRed = true;
  const extraColors = ['yellow', 'green'];
  final colors = [
    'grey',
    'brown',
    if (addBlue) 'blue',
    if (addRed) 'red',
    for (var color in extraColors) color,
    ...extraColors,
  ];
  
  print(colors);
}
```
### Collection 복사
```dart
void main() {
  final list = [1,2,3];
  final copy1 = list;     // reference copy
  final copy2 = [...list];// value copy
}
```

## Null Safety
컴파일 단계에서 null 참조 에러를 체크함.
- null : no value
- Dart 2.12 버전부터 사용 가능

https://medium.com/flutter-korea/flutter%EC%9D%98-null-safety-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0-dd4ee1f7d6a5
![image](https://user-images.githubusercontent.com/17891566/212697645-d9cf2dd1-8ea9-400f-bda2-bdb203fa385c.png)

### Null Safety 특징 
1. Promotion : nullable 변수가 non-nullable로 변할 수 있다.
```dart
void main() {
  int? a;
  int b = 2;
  if (a == null) {
    print('a is null');
  } else {
    print(a + b);
  }
}
```
2. Definite Assignment : 변수가 언제 할당되는 지 알기 때문에 나중에 초기화할 수 있다.
```dart
void main() {
  int x = 10;
  int sign;
  if (x >= 0) {
    sign = 1;
  } else {
    sign = -1;
  }
  print(sign);
}
```

### Operator

#### Assertion Operator (!)
nullable 변수가 항상 값을 가질 경우 ! 사용하여 non-nullable 변수에 할당 가능   
null일 경우 런타임 에러 발생

#### if-null Operator (??)
null일 경우 ?? 뒤의 값을 사용한다.
```dart
void main() {
  int x = -1;
  int? y;
  int? z;
  
  if (x > 0) { y = x; }
  if (x > 5) { z = x; }
  int valueY = y ?? 0;  // 방법 1
  z ??= 0;              // 방법 2
  int valueZ = z;
}
```

## Functions
- {} 중괄호로 감쌀 경우 argument 지정이 가능하다.
- argument
  - nullable
  - default value 지정 
  - required 표시

```dart
void main() {
  final person = describe('Andrea', 36);
  final person2 = describeWithArgument(name: 'Andrea', age: 36);
}

String describe(String name, int age) {
  return "My name is $name. I'm $age years old.";
}

String describeWithArgument({required String name, required int age}) {
  return "My name is $name. I'm $age years old.";
}
```
### Fat arrow notation =>
한 줄로 표현 가능
```dart
int sum(int x, int y) => x + y;
int sum2(int x, int y) {
  return x + y;
}
```

### Inner Functions

```dart
void main() {
  void foo() {
    print("This function is foo.");
    void bar() {
      print("This function is bar.");
    }
    bar();
  }
  foo();
}
```

### Anonymous Functions
```dart
void main() {
  final sayHi = (String name) => 'Hi, $name';
  print(sayHi('Andrea'));
  
  final sayHello = ({required String name}) => 'Hello $name';
  print(sayHello(name: 'Andrea'));
}
```

### Function type
```dart
typedef Greet = String Function(String);
typedef Introduce = String Function(String, int);

void main() {
  final sayHi = (String name) => 'Hi, $name';
  welcome(sayHi, 'Andrea');
  final introduce = (String name, int age) => "I'm $name. $age years old.";
  iam(introduce, 'Andrea', 35);
}

void welcome(Greet greet, String name) {
  print(greet(name));
  print('Welcome to this course');
}

void iam(Introduce introduce, String name, int age) {
  print(introduce(name, age));
  print('Welcome to this course');
}
```

### Closures
참고 : https://www.tutorealcode.com/flutter/closure
```dart
void main() {
  const multiplier = 10;
  const list = [1, 2, 3];
  final result = list.map((x) {
    return x * multiplier;
  });
  print(result);
}
```

### Function operators
```dart
void main() {
  const list = [1, 2, 3];
  
  // forEach
  list.forEach((value) => print(value));
  list.forEach(print);
  
  // map : lazy Iterable 타입 Return
  final List<int> doubles = list.map((value) => value * 2).toList();
  print(doubles); // (2, 4, 6)
  
  // Generic : 코드 안정성 높이고 중복 줄여줌.
  const list2 = [1.0, 2.0, 3.0];
  final rounded = transform<double, int>(list2, (x) => x.round());
  print(rounded);
  
  // where : 조건에 맞는 아이템 리스트를 Return
  // firstWhere : 처음으로 조건에 맞는 아이템 Return
  const list3 = [1, 2, 3, 4];
  final even = list3.where((value) => value % 2 == 0);
  print(even);
  final value = list3.firstWhere((x) => x == 5, orElse: () => -1);
  print(value);
  
  // reduce : List의 모든 아이템을 결합하여 하나의 결과를 도출함.
  const list4 = [1, 2, 3, 4];
  final sum = list4.reduce((value, element) => value + element);
  print(sum);
}

List<R> transform<T, R>(List<T> items, R Function(T) f) {
  var result = <R>[];
  for (var x in items) {
    result.add(f(x));
  }
  return result;
}
```
</details>

## Classes

- 모든 변수가 final일 경우 const 생성자를 쓰면 최적화 가능
### Constructor
```dart
class BankAccount {
  BankAccount(double balance) {
    this.balance = balance;
  }

  double balance = 0;
}

class BankAccount2 {
  /// 생성자 전달 인자로 초기화하므로 balance를 임의의 값으로 초기화해줄 필요 없음.
  BankAccount2(double balance) : balance = balance;

  double balance;
}

class BankAccount3 {
  /// 2. 생성자 전달 인자 추가
  /// 3. 초기화 목록에서 멤버 변수를 초기화
  BankAccount3({
    required String accountHolder,
    double balance = 0,
  })  : accountHolder = accountHolder,
        balance = balance;

  /// 1. 멤버 변수 생성
  String accountHolder;
  double balance;
}

class BankAccount4 {
  /// 간단하게
  BankAccount4({
    required this.accountHolder,
    this.balance = 0,
  });

  String accountHolder;
  double balance;
}
```
### Named Constructor
```dart
class Complex {
  const Complex(this.re, this.im);
  const Complex.zero() : re = 0, im = 0;
  const Complex.identity() : re = 1, im = 0;
  const Complex.real(this.re) : im = 0;
  const Complex.imaginary(this.im) : re = 0;
  
  final double re;
  final double im;
}
```
### Getter and setter
```dart
class Temperature {
  Temperature.celsius(this.celsius);
  Temperature.farenheit(double farenheit) : celsius = (farenheit - 32) / 1.8;

  // 저장된 변수
  double celsius;
  // 계산된 변수
  double get farenheit => celsius * 1.8 + 32;
  set farenheit(double farenhiet) => celsius = (farenheit - 32) / 1.8;
}
```

### Private variables, methods
- _를 붙이면 Private 변수가 됨.
- private 변수와 public getter 변수를 사용하여 read-only 변수로 사용할 수 있음.
