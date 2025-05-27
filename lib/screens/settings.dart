import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isLoading = false;
  bool isOn = false;
  String? selectedValue;
  final options = ['Opcja 1', 'Opcja 2', 'Opcja 3'];
  bool isChecked = false;
  bool _isPasswordVisible = false;
  String segmentedButtonVelue = 'sec';
  double sliderValue = 0.7;
  String? _selectedOption;
  final List<String> listOptions = [
    'Opcja 1',
    'Opcja 2',
    'Opcja 3',
    'Opcja 4',
    'Opcja 5',
    'Opcja 6',
  ];

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Kliknięcie poza dialogiem go zamyka
      barrierColor: Colors.black.withOpacity(0.5), // Overlay
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Okienko"),
          content: Text("Akuku!"),
          actions: [
            TextButton(
              child: Text("Zamknij"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Settings')
          ),

          body: SingleChildScrollView( // Scroll does not work. Use LayoutBuilder
            padding: EdgeInsets.all(16),
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
                ),

                const SizedBox(height: 15),

                SegmentedButton(
                  // style: SegmentedButton.styleFrom(
                  //   backgroundColor: Colors.grey[200],
                  //   foregroundColor: Colors.red,
                  //   selectedForegroundColor: Colors.white,
                  //   selectedBackgroundColor: Colors.green,
                  // ),
                  segments: const <ButtonSegment<String>>[
                    ButtonSegment<String>(
                      value: 'sec',
                      label: Text('1 sec'),
                      icon: Icon(Icons.lock_clock)
                    ),
                    ButtonSegment<String>(
                        value: 'min',
                        label: Text('1 min'),
                        icon: Icon(Icons.punch_clock)
                    ),
                    ButtonSegment<String>(
                        value: 'hour',
                        label: Text('1 hour'),
                        icon: Icon(Icons.lock_clock_sharp)
                    ),
                    ButtonSegment<String>(
                        value: 'day',
                        label: Text('1 day'),
                        icon: Icon(Icons.calendar_view_day)
                    ),
                  ],
                  selected: <String>{segmentedButtonVelue},
                  onSelectionChanged: (Set<String> newSelection) {
                    setState(() {
                      segmentedButtonVelue = newSelection.first;
                    });
                  },
                ),

                const SizedBox(height: 15),

                Slider(
                    value: sliderValue,
                    onChanged: (value) {
                      setState(() {
                        sliderValue = value;
                      });
                    }
                ),

                const SizedBox(height: 15),

                ElevatedButton(
                    onPressed: () => _showPopup(context),
                    child: Text('Click me')
                ),

                const SizedBox(height: 15),

                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: listOptions.map((option) {
                    bool isSelected = option == _selectedOption;
                    return ListTile(
                      title: Text(option),
                      tileColor: isSelected ? Colors.grey.withOpacity(0.2) : null,
                      trailing: isSelected ? Icon(Icons.check, color: Colors.blue) : null,
                      onTap: () {
                        setState(() {
                          _selectedOption = option;
                        });
                      },
                    );
                  }).toList(),
                ),

              ],
            )
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
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
                      setState(() {
                        _isLoading = true;
                      });

                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          _isLoading = false;
                        });
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          )
        ),
        if (_isLoading)
          Container(
            color: Colors.black54,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ]
    );
  }

}