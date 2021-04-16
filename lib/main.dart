import 'package:flutter/material.dart';
import 'package:flutter_animations/dashatar.dart';
import 'package:lottie/lottie.dart';

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
      home: MyHomePage(title: 'Lottie Animations'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              height: 50.0,
              minWidth: 200.0,
              onPressed: () {
                _showAnimation('assets/gift.json');
              },
              color: Theme.of(context).primaryColor,
              child: Text('Gift'),
            ),
            SizedBox(height: 20.0),
            MaterialButton(
              height: 50.0,
              minWidth: 200.0,
              onPressed: () {
                _showAnimation('assets/emoji.json');
              },
              color: Theme.of(context).primaryColor,
              child: Text('Emoji'),
            ),
            SizedBox(height: 20.0),
            MaterialButton(
              height: 50.0,
              minWidth: 200.0,
              onPressed: () {
                _showAnimation('assets/favorite.json');
              },
              color: Theme.of(context).primaryColor,
              child: Text('Favorite'),
            ),
          ],
        ),
      ),
    );
  }

  _showAnimation(String animationAsset) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Lottie.asset(animationAsset),
      ),
    );
  }
}
