import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Basic List';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: ListView(
          children: const <Widget>[
            ListTile(leading: Icon(Icons.map), title: Text('Map')),
            ListTile(leading: Icon(Icons.photo_album), title: Text('Album')),
            ListTile(leading: Icon(Icons.phone), title: Text('Phone')),
            ListTile(
              leading: Icon(Icons.verified_user_outlined),
              title: Text('User 1'),
            ),
            ListTile(
              leading: Icon(Icons.verified_user_outlined),
              title: Text('User 2'),
            ),
            ListTile(
              leading: Icon(Icons.verified_user_outlined),
              title: Text('User 3'),
            ),
          ],
        ),
      ),
    );
  }
}
