// starting the program
void main() {
  // calling the nullable function
  var details = myString();
  print(details);

  // this code in not printing the name of book
  // but returning 'null'
}

String? myString() {
  String bookName = "Treasure Island";

  // this will print the name of book
  print(bookName);
  return null; // this will be called after printing the name
}
