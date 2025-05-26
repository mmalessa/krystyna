import 'package:flutter/material.dart';

class SomethingScreen extends StatelessWidget {
  const SomethingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Something')
      ),
      body: const Center(
        child: Text("There will be something very important here someday.\nFor now, however, there is only this text."),
      )
    );
  }

}