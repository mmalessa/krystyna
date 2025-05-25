import 'package:flutter/material.dart';
import 'package:krystyna/screens/speech_demo.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  void _selectModule(BuildContext context, String moduleName)  {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => SpeechDemo()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Krystyna App'),
      ),
      body: InkWell(
        onTap: () {
          _selectModule(context, 'moduleName');
        },
        child: Center(
          child: const Text('Speech demo'),
        ),
      )
    );
  }

}