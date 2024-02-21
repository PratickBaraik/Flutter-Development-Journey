// entry of program

void main() {
  // dynamic type in dart
  dynamic myFirstValue = "Dart";
  dynamic mySecondValue = 1.01;
  dynamic myThirdValue = true;
  dynamic myFourthValue = 1000;

  // printing the values of dynamic type variable
  print("Dynamic type variable values");
  print("My first value: $myFirstValue");
  print("My second value: $mySecondValue");
  print("My third value: $myThirdValue");
  print("My fourth value: $myFourthValue");

  // re-assigning the dynamic type variable
  myFirstValue = "Flutter";
  mySecondValue = "Developer";

  // printing the re-assigned values of dynamic type
  print("\nRe-assigned values");
  print("My first value: $myFirstValue");
  print("My second value: $mySecondValue");

}
