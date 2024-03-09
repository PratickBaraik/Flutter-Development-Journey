// starting the program
import 'dart:io';

void main() {
  dynamic storeFunc = OuterFun();
  print("\nEnter first value: ");
  int? num1 = int.parse(stdin.readLineSync()!);
  print("\nEnter second value: ");
  int? num2 = int.parse(stdin.readLineSync()!);
  print("\nEnter third value: ");
  int? num3 = int.parse(stdin.readLineSync()!);
  // printing the inner function
  print("Total: ${storeFunc(num1, num2, num3)}");
}

// my self defined function with function inside it
Function OuterFun() {
  // below function is adding three numbers
  Function InnerFun = (int? num1, int? num2, int? num3) {
    return num1! + num2! + num3!;
  };

  // returning the inner function
  return InnerFun;
}
