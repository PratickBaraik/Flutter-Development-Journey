import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  //getting text editing controller
  TextEditingController myController = TextEditingController();

  //greeting message variable
  String greetingMessage = '';

  //greet the user method
  void greetUser() {
    setState(() {
      greetingMessage = "Added: " + myController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            size: 32,
          ),
          onPressed: () {},
        ),

        title: const Text(
          'Demo 10',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        centerTitle: true,

        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_rounded,
              size: 32,
            ),
            onPressed: () {},
          )
        ],

        backgroundColor: Colors.amber[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(greetingMessage),
              Container(
                height: 50,
              ),
              //text field to take input
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  hintText: 'Enter your task',
                ),
              ),

              //button
              ElevatedButton(
                onPressed: greetUser,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.amber[700]!
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
