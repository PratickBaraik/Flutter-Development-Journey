// starting the program
void main() {
  print("Use of patterns");
  // de-structuring the record using pattern
  var (id, name, available) = myFunction(10, "Perfume", true); // declaration of patter
  // it keeps all the parameters stored in a var data type
  // it can be printed in following ways
  print("Id: $id");
  print("Name: $name");
  print("Is available: $available");
}

// using records of dart to create function with multiple data type
(int, String, bool) myFunction(int id, String name, bool avail) {
  return (id, name, avail); // returning more than one value
}
