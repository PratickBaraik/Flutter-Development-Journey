// typedef keyword is used to create a new custome type or instance of a function class.

// there are two types of typedef present in dart

// custome type
typedef MyList = List<int>;

// instance of a function class
typedef Evaluate(int num1, int num2);

// body of MyList
MyList printNumber(MyList nums) {
  // printing numbers
  print(nums);
  return nums;
}

// instance for multiplication class
Multiply(int num1, num2) {
  // storing the multiple of two numbers
  var mul = num1 * num2;

  // printing the result
  print("Multiplication of two numbers: " + mul.toString());
}

// instance for addition class
Addition(int num1, int num2) {
  // storing the sum of two numbers
  var sum = num1 + num2;

  // printing the result
  print("Addtion of two numbers: " + sum.toString());
}

Substraction(int num1, int num2) {
  // storing the difference of two numbers
  int sub = (num1 > num2) ? num1 - num2 : num2 - num1; // ternary operator

  // printing the result
  print("Subtraction of two numbers: " + sub.toString());
}

// driver main function
void main() {
  // using the MyList typedef
  MyList nums = [1, 2, 3, 4, 5];

  // printing the list
  print("My list: " + nums.join(", "));

  // using the instance of class typedef
  Evaluate add = Addition;
  add(10, 20);

  Evaluate sub = Substraction;
  sub(10, 20);

  Evaluate mul = Multiply;
  mul(5, 4);
}
