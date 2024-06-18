// import dart core package
import 'dart:core';
// importing dart i/o package
import 'dart:io';

void main() {
  var firstName = 'Pratick';
  var lastName = 'Baraik';

  print(firstName + ' ' + lastName);

  stdout.writeln("What is your current status?");
  String? status = stdin.readLineSync();
  print('Current Status: $status\n\n');

  // demo of static and dynamic type variable in dart
  int amt1 = 2000;
  var amt2 = 4000;
  print('Amount 1 = $amt1 and Amount 2 = $amt2\n');

  double discount1 = 5.6;
  var discount2 = 4.7;
  print('Discount 1 = $discount1 and Discount 2 = $discount2\n');

  String customer1 = 'Adhesh';
  var customer2 = 'Sumesh';
  print('Customer 1 = $customer1 and Customer 2 = $customer2\n');

  bool buy1 = false;
  var buy2 = true;
  print('Sell Status 1 = $buy1 and Sell Status 2 = $buy2\n');

  // using dynamic variable declaration
  dynamic mutable = 1000;
  print('Mutable = $mutable\n');
  mutable = 500;
  print('Mutable = $mutable\n');
  mutable = null;
  print('Mutable = $mutable\n');

  // defining raw string
  String myRaw =
      r'Welcome to this dart programming,\n I am your dart coach Pratick.';
  print('Raw string -> $myRaw\n');
}
