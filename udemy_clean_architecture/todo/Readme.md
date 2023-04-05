# Dart & Flutter - Zero to Mastery [2023] + Clean Architecture

강의 : https://www.udemy.com/course/flutter-made-easy-zero-to-mastery/     
소스 : https://github.com/OpenSphereSoftware/FlutterMadeEasy_ZeroToMastery/tree/main/2_flutter       

## Flutter Basics
- MaterialApp : 앱의 테마, 경로, 지원 언어 등 정의할 수 있음.
- Scaffold : 화면의 기본 레이아웃. AppBar, NavigationBar 등 정의할 수 있음.

### Column
- mainAxisSize
  - min : children 끝나는 지점에 height가 설정됨.
  - max : infinity height가 설정됨.
- mainAxisAlignment
  - center : children의 top,bottom이 동일하게 가운데 정렬됨.
  - spaceAround : children이 동일한 영역 크기를 갖고 각각 가운데 정렬됨.
  - spaceBetween : children이 동일한 여백 크기를 가짐.
- crossAxisAlignment
  - start : children이 왼쪽 끝에 정렬됨.   
  - end : children이 오른쪽 끝에 정렬됨.  

### Flexible, Expanded
- Flexible
  - flex 파라미터로 어느정도 차지할 지에 대해 지정 가능
  - FlexFit.loose (Default) : 필요한 만큼만 차지
  - FlexFit.tight : 가능한 영역 전체 차지
- Expanded : FlexFit.tight로 고정된 Flexible

### 팁
stful, stless 입력 시 자동으로 Widget 생성됨.
<img width="548" alt="스크린샷 2023-02-05 오후 9 32 19" src="https://user-images.githubusercontent.com/17891566/216818877-df8d56e4-72b4-4b1f-b1e2-7e843df329f5.png">

VS Code는 Widget을 새 Widget으로 분리하는 **Extract Widget** 가능.
<img width="515" alt="스크린샷 2023-02-05 오후 9 41 47" src="https://user-images.githubusercontent.com/17891566/216819248-7a970801-5b2c-4968-a691-6a91ed1766b5.png">
