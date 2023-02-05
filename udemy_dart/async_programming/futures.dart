Future<String> fetchUserOrder() => Future.delayed(
      Duration(seconds: 2),
      () => 'Cappucchino',
    );

Future<String> fetchUserOrder2() => Future.value('Espresso');
Future<String> fetchUserOrder3() => Future.error(Exception('Out of milk'));

Future<void> main() async {
  print('Program stared');
  try {
    final order = await fetchUserOrder();
    print(order);
  } catch (e) {
    print(e);
  }
}
