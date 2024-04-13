// starting the program
void main() {
  // normal arithmetic operation
  print(1 + 3);
  print(10 - 4);
  print(3 * 4);
  print(8 / 3);
  print(3 % 2);

  // doing operations on string
  print('20' + '10'); // returns 2010
  // print('3' + 3); value of type 'int' can'nt be assigned to a variable of type 'string'
  // printing a string value number of times
  print('pratick ' * 5); // helps to print values for desired number of times

  // operator precedence in dart
  print(5 * 7 + 8 / 2 - 1 % 10); // precedence from left

  // using the type test operator
  String name = "Pratick";
  double value = 33.22;
  int price = 13000;

  // using 'is' operator to compare
  print(name is String); // true
  print(value is int); // false
  print(price is double); // false

  print(value is double); // true
  print(price is int); // true

  // using the 'as' operator
  dynamic myVar = "Dart"; // using dynamic to change the value in run time.
  String str = myVar as String; // checking for string
  print(str); // true

  // changing the value of 'myVar'
  myVar = 100;
  int myInt = myVar as int; // checking for int
  print(myInt);

  // using 'is!' operator
  print(myVar is! double); // true
}
