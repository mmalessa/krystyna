import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:krystyna/screens/home.dart';
import 'package:krystyna/screens/start.dart';

// final theme = ThemeData(
//   useMaterial3: true,
//   colorScheme: ColorScheme.fromSeed(
//     brightness: Brightness.dark,
//     seedColor: const Color.fromARGB(255, 131, 57, 0),
//   ),
//   textTheme: GoogleFonts.latoTextTheme().apply(
//     bodyColor: Colors.white54,
//     displayColor: Colors.white70
//   ),
// );

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: StartScreen()
    );
  }
}
