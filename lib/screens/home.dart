import 'package:flutter/material.dart';
import 'package:krystyna/screens/something.dart';
import 'package:krystyna/screens/speech_demo.dart';
import 'package:krystyna/screens/start.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  Widget currentScreen = StartScreen();

  void _onMenuSelected(String value) {
    setState(() {
      switch (value) {
        case 'speechdemo':
          currentScreen = SpeechDemo();
          break;
        case 'something':
          currentScreen = SomethingScreen();
          break;
        default:
          currentScreen = StartScreen();
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Text('Krystyna App'),
          actions: [
            PopupMenuButton<String>(
              onSelected: _onMenuSelected,
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                      value: 'start',
                      child: Text('Start')
                  ),
                  const PopupMenuItem(
                      value: 'speechdemo',
                      child: Text('Speech Demo')
                  ),
                  const PopupMenuItem(
                      value: 'something',
                      child: Text('Something')
                  ),
                ];
              },
            )
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: currentScreen,
      )
    );
  }
}


