main() {
  // string to int
  String myIntStr = '1234';
  int convertedInt = int.parse(myIntStr);
  print('Original string: $myIntStr');
  print('Converted string to int: $convertedInt\n');
  assert(myIntStr == 1234);

  // string to double
  String myDoubleStr = '44.32';
  double convertedDouble = double.parse(myDoubleStr);
  print('Original string: $myDoubleStr');
  print('Converted string to double: $convertedDouble\n');

  // second way
  String intToStr = 124.toString();
  if (intToStr is String) {
    print(intToStr);
  } else {
    print("Next time!");
  }

  String doubleToStr = 3.14159.toStringAsFixed(3);
  assert(doubleToStr == '3.141');
  print(doubleToStr);
}
