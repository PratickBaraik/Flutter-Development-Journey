// starting the program
void main() {
  print("Use of records");
  var cosmetic = myFunction(10, "Perfume", true);
  var footware = myFunction(34, "Sneakers", false);

  // printing the details of cosmetic
  print(cosmetic);
  // printing selective data using getters
  print(cosmetic.$2);

  // printing the details of footware
  print(footware);
  // printing selective data using getters
  print(footware.$3);
}

// using records of dart to create function with multiple data type
(int, String, bool) myFunction(int id, String name, bool avail) {
  return (id, name, avail); // returning more than one value
}
