// starting the program

import 'dart:io';

var myNum = null; // this variable has the lexical scope
void main() {
  // taking input for main function
  print("\nEnter value for main function: ");
  myNum = int.parse(stdin.readLineSync()!);
  print("For main funciton num = $myNum");

  void innerFunc() {
    // taking input for inner function
    print("\nEnter value for inner function: ");
    myNum = int.parse(stdin.readLineSync()!);
    print("Now for inner function num = $myNum");
  }

  // calling the inner function
  innerFunc();

  // calling the outer function
  outerFunc();
}

void outerFunc() {
  // taking input for outer function
  print("\nEnter value for outer function: ");
  myNum = int.parse(stdin.readLineSync()!);
  print("Now for outer function num = $myNum");
}
