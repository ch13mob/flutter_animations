import 'package:animated_text_kit/animated_text_kit.dart';
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
      home: MyHomePage(title: 'Animated Text Kit'),
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
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SizedBox(
            width: double.infinity,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'The first rule of Fight Club is: you do not talk about Fight Club.',
                ),
                TypewriterAnimatedText(
                  'The second rule of Fight Club is: you do never talk about Fight Club.',
                ),
                TypewriterAnimatedText(
                  'Third rule of Fight Club: someone yells stop, goes limp, taps out, the fight is over.',
                ),
                TypewriterAnimatedText(
                  'Fourth rule: only two guys to a fight.',
                ),
                TypewriterAnimatedText(
                  'Fifth rule: one fight at a time, fellas.',
                ),
                TypewriterAnimatedText(
                  'Sixth rule: no shirts, no shoes.',
                ),
                TypewriterAnimatedText(
                  'Seventh rule: fights will go on as long as they have to.',
                ),
                TypewriterAnimatedText(
                  'And the eighth and final rule: if this is your first night at Fight Club, you have to fight.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
