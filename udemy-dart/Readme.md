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

#### Flutter vs Dart
// TODO - 작성하기 


</details>
