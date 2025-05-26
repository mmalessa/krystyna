import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isOn = false;
  String? selectedValue;
  final options = ['Opcja 1', 'Opcja 2', 'Opcja 3'];
  bool isChecked = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Settings')
      ),


      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            const Row(
              children: [
                const Text("Stały tekst"),
              ],
            ),

            const SizedBox(height: 15),

            TextField(
              decoration: InputDecoration(
                labelText: 'Wprowadź wartość',
                border: OutlineInputBorder(),
              ),
              // onChanged: (value) {
              //   print('Wartość: $value');
              // },
            ),

            const SizedBox(height: 15),

            TextField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Hasło tajemne',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Switch(
                  value: isOn,
                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                    });
                  },
                ),
                Text('Jakiś przełącznik')
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                DropdownButton<String>(
                  hint: Text('Wybierz opcję'),
                  value: selectedValue,
                  items: options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                ),
              ]
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text('Coś jest lub czegoś nie ma')
              ],
            )
          ],
        )
      ),


      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }


}