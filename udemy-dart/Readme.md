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

## Collections

### List (Array)
- 중복된 값을 포함할 수 있는 Collection

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

```dart
void main() {
  var countries = {'Italy', 'UK', 'Russia'};
  
  print(countries.elementAt(0));
  print(countries.first);
  print(countries.last);
  print(countries.length);
  
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
