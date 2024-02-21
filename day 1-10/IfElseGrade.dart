// entry point of program
void main() {
  // declaring a double default gpa
  double gpa = 8.3;

  // using the if else conditional block
  if (gpa > 9) {
    //printing the statement
    print("Grade: A+");
  } else if (gpa < 9 && gpa > 8) {
    print("Grade: A");
  } else if (gpa < 8 && gpa > 7) {
    print("Grade: B");
  } else if (gpa < 7 && gpa > 6) {
    print("Grade: C");
  } else {
    print("Grade: D");
  }
}
