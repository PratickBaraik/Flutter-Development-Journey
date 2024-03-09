// starting the program
import 'dart:io';

void main() {
  // dart program to take input from the user

  // taking integer input
  print("Enter an integer value: ");
  int? myInt = int.parse(stdin.readLineSync()!);
  print("My integer value: $myInt\n");

  // taking double/decimal input
  print("Enter a double value: ");
  double? myDouble = double.parse(stdin.readLineSync()!);
  print("My double value: $myDouble\n");

  // taking string input
  print("Enter a string value: ");
  String? myString = stdin.readLineSync()!;
  print("My string value: $myString\n");
}
