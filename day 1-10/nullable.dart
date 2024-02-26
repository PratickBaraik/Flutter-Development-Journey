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
  return null;
}
