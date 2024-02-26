//starting the program
// default main function
void main() {
  // printing and calling the user defined function
  print("My name is ${myName()}"); // using interpolation to call the function

  // calling the function with parameters
  myStore("Calender", 70, 27);
  print("\n");
  myStore("Gift cards", 30, 15);
  print("\n");
  myStore("Stove", 7, 300);
  print("\n");
}

// my own function
String myName() {
  String name = "Pratick Baraik";
  // returning the name
  return name;
}

// function with arguments
void myStore(String item, int price, int quantity) {
  // statements to show details
  print("Name: $item");
  print("Price: $price");
  print("Number of items: $quantity");
  print("Total amount: ${price * quantity}");
}
