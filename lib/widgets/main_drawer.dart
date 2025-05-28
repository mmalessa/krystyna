import 'package:flutter/material.dart';
import 'package:krystyna/screens/settings.dart';
import 'package:krystyna/screens/something.dart';
import 'package:krystyna/screens/speech_demo.dart';
import 'package:krystyna/widgets/main_drawer_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  void _selectScreen(BuildContext context, Widget page)  {
    Navigator.of(context).pop(); // Close drawer
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (ctx) => page
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Baseline(
                  baseline: 32,
                  baselineType: TextBaseline.alphabetic,
                  child: Image.asset(
                    'assets/icon/icon_fg_128.png',
                    width: 48,
                    height: 48,
                  ),
                ),
                const SizedBox(width: 18),
                Text(
                  'Krystyna',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    // color: Theme.of(context).colorScheme.primary,
                    fontSize: 32,
                  )
                )
              ],
            )
          ),
          MainDrawerItem(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () { _selectScreen(context, SettingsScreen()); }
          ),
          MainDrawerItem(
            icon: Icons.question_answer,
            title: 'Speech demo',
            onTap: () { _selectScreen(context, SpeechDemo()); }
          ),
          MainDrawerItem(
            icon: Icons.question_mark,
            title: 'Something',
            onTap: () { _selectScreen(context, SomethingScreen()); }
          ),
        ],
      ),
    );
  }}