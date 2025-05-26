import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MainDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onBackground;
    final textStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
      color: color,
      fontSize: 22,
    );

    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: color,
      ),
      title: Text(title, style: textStyle),
      onTap: onTap,
    );
  }
}
