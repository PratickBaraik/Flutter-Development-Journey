// starting the program
import 'dart:io';

void main() {
  customer("Pratick", myFunc);
}

// storing an anonymous function into a variable
Function myFunc = (int totalAmount) {
  if (totalAmount >= 40000) {
    return 'Buy Realme 9 pro phone';
  } else {
    return 'Amount is not enough to buy Realme 9 pro phone';
  }
};

void customer(String? name, Function assure) {
  // taking input from user
  print("Enter name: ");
  name = stdin.readLineSync();
  print("Enter amount: ");
  int? amount = int.parse(stdin.readLineSync()!);

  // printing the result together with a function as an argument
  print('$name, ${assure(amount)}');
}
