// not importing the dafault import dart:core package

main() {
  // string to int
  String myIntStr = '1234';
  int convertedInt = int.parse(myIntStr);
  print('Original string: $myIntStr');
  print('Converted string to int: $convertedInt\n');

  // string to double
  String myDoubleStr = '44.32';
  double convertedDouble = double.parse(myDoubleStr);
  print('Original string: $myDoubleStr');
  print('Converted string to double: $convertedDouble\n');
}
