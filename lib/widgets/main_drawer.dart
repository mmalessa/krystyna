import 'package:flutter/material.dart';
import 'package:krystyna/screens/settings.dart';
import 'package:krystyna/screens/something.dart';
import 'package:krystyna/screens/speech_demo.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  void _selectPage(BuildContext context, Widget page)  {
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
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 22
              )
            ),
            onTap: () {
              _selectPage(context, SettingsScreen());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.question_answer,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
                'Speech demo',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 22
                )
            ),
            onTap: () {
              _selectPage(context, SpeechDemo());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.question_mark,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
                'Something',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 22
                )
            ),
            onTap: () {
              _selectPage(context, SomethingScreen());
            },
          )
        ],
      ),
    );
  }}