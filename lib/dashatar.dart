import 'package:flutter/material.dart';

class Dashatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      color: Colors.grey,
      child: Image.network(
        'https://firebasestorage.googleapis.com/v0/b/dashatar-dev.appspot.com/o/dashatars%2FRGFzaGF0YXJfQm9udXNfU2V0c19Cb251c19F.png?alt=media',
      ),
    );
  }
}
