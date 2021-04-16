import 'package:flutter/material.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _isAnimationCompleted = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      reverseDuration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _isAnimationCompleted
                ? _animationController.reverse()
                : _animationController.forward();
            _isAnimationCompleted = !_isAnimationCompleted;
          },
          child: ClipOval(
            child: Container(
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              child: Center(
                child: AnimatedIcon(
                  icon: AnimatedIcons.event_add,
                  progress: _animationController,
                  color: Colors.black,
                  size: 60.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
