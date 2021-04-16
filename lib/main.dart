import 'dart:math';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (_, Widget child) {
                  return ClipPath(
                    child: child,
                    clipper: ArcClipper(_controller.value),
                  );
                },
                child: Dashatar(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.repeat();
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  final double _clipValue;

  ArcClipper(this._clipValue);

  @override
  Path getClip(Size size) {
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final angle = pi * 2 * _clipValue;
    return Path()
      ..moveTo(center.dx, center.dy)
      ..lineTo(center.dx, center.dy - radius)
      ..arcTo(
        Rect.fromCenter(
          center: center,
          width: size.width,
          height: size.height,
        ),
        -pi / 2,
        angle,
        true,
      )
      ..lineTo(center.dx, center.dy)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
