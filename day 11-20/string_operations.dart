// importing dart core
import 'dart:core';

main() {
  String singleQuote = 'Dart can store text in single quotes.';
  String doubleQuote = "Dart can store text in double quotes.";
  print('Single quote text - $singleQuote');
  print('Double quote text - $doubleQuote\n');

  String message1 = "I am a dart programmer. I'd like to make applications.";
  String message2 = 'I am a "Dart Programmer".';
  print("Message 1 - $message1");
  print("Message 2 - $message2\n");

  // Defining raw string variable
  String myRaw = r"This\nis\na\nraw\nstring\n.";
  print("The raw string text - $myRaw\n");

  // single and multi line strings in dart
  String singleLine = 'This is a single line string in dart.';
  String multiLine1 = """This is 
  a multi line string type 1.""";
  String multiLine2 = '''This is a 
  multi line string type 2.''';
  print('Single Line - $singleLine');
  print('Multi Line 1 - $multiLine1');
  print('Multi Line 2 - $multiLine2\n');

  
}
