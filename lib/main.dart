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
      home: MyHomePage(title: 'Flutter Animations'),
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
  final _colorTween = ColorTween(begin: Colors.blue, end: Colors.orange);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: _colorTween,
          duration: const Duration(seconds: 2),
          builder: (_, Color colorValue, Widget child) {
            return Container(
              width: 200.0,
              height: 200.0,
              color: colorValue,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
