import 'package:flutter/material.dart';
import 'package:flutter_animations/dashatar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'AnimatedContainer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _isChecked ? 50.0 : 300.0,
          height: _isChecked ? 300.0 : 50.0,
          color: _isChecked ? Colors.blue : Colors.orange,
          duration: const Duration(seconds: 1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isChecked = !_isChecked;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
