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
              children: [
                Icon(Icons.woman_2, size: 48, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 18),
                Text(
                  'Krystyna',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary
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