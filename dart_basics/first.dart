void main() {
  print("hello world");

  // calling the function
  calculate();

  // calling the myfunction
  myFunction();
}

// user defined dart function
void calculate() {
  // initialization of some variables
  var first_number = 10;
  var second_number = 20;

// computing total
  var total_of_numbers = first_number + second_number;

// printing the total
  print("Total of two numbers: " + total_of_numbers.toString());
}

// function which contains different types of variables
void myFunction() {
  var myName = 'Pratick'; // my name
  var myId = 1167; // my id
  var PI = 3.14; // value of pi
  var myArray = ['Calculator', 'Rular', 'Pencil', 'Laptop', 'Note book'];

  // printing all details
  print("My name: " + myName); // printing my name
  print("My id: " + myId.toString()); // printing my id
  print("Value of PI: " + PI.toString()); // printing the value of PI
  print("Elements of array: " + myArray.join(", "));
}
