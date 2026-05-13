import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yt First App",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("YouTube 1 App")),
      body: TextInputWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Hello World!");
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  String text = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void changeText(text) {
    if (text == "Hello World") {
      controller.clear();
      text = "";
    }
    setState(() => this.text = text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: this.controller,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.message_outlined),
            labelText: "Type a message:",
          ),
          onChanged: (text) => this.changeText(text),
        ),
        Text(this.text),
      ],
    );
  }
}
