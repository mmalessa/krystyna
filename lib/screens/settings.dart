import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isOn = false;
  bool isChecked = false;
  String segmentedButtonValue = 'sec';
  double sliderValue = 0.7;

  String someValue = '';
  String somePassword = '';

  final dropdownOptions = ['Opcja 1', 'Opcja 2', 'Opcja 3'];
  String dropdownValue = 'Opcja 3';
  
  final List<String> listOptions = [
    'Opcja 1',
    'Opcja 2',
    'Opcja 3',
    'Opcja 4',
    'Opcja 5',
    'Opcja 6',
  ];
  String listValue = 'Opcja 1';

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  @override
  void dispose() {
    _valueController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loadConfig() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      isOn = prefs.getBool('isOn') ?? false;
      isChecked = prefs.getBool('isChecked') ?? false;
      sliderValue = prefs.getDouble('sliderValue') ?? 0;
      segmentedButtonValue = prefs.getString('segmentedButtonValue') ?? '';
      dropdownValue = prefs.getString('dropdownValue') ?? dropdownOptions[0];
      listValue = prefs.getString('listValue') ?? listOptions[0];
      someValue = prefs.getString('someValue') ?? '';
      somePassword = prefs.getString('somePassword') ?? '';
    });
    _valueController.text = someValue;
    _passwordController.text = somePassword;
  }

  Future<void> _saveOption(String key) async {
    final prefs = await SharedPreferences.getInstance();

    switch(key) {
      case 'isOn':
        prefs.setBool('isOn', isOn);
        break;
      case 'isChecked':
        prefs.setBool('isChecked', isChecked);
        break;
      case 'sliderValue':
        prefs.setDouble('sliderValue', sliderValue);
        break;
      case 'segmentedButtonValue':
        prefs.setString('segmentedButtonValue', segmentedButtonValue);
        break;
      case 'dropdownValue':
        prefs.setString('dropdownValue', dropdownValue);
        break;
      case 'listValue':
        prefs.setString('listValue', listValue);
        break;
      case 'someValue':
        prefs.setString('someValue', someValue);
        break;
      case 'somePassword':
        prefs.setString('somePassword', somePassword);
        break;
    }
  }

  Future<void> _saveConfig() async {
    final prefs = await SharedPreferences.getInstance();

    await Future.wait([
      prefs.setBool('isOn', isOn),
      prefs.setBool('isChecked', isChecked),
      prefs.setDouble('sliderValue', sliderValue),
      prefs.setString('segmentedButtonValue', segmentedButtonValue),
      prefs.setString('dropdownValue', dropdownValue),
      prefs.setString('listValue', listValue),
      prefs.setString('someValue', someValue),
      prefs.setString('somePassword', somePassword),
    ]);
    setState(() {
      _isLoading = false;
    });
  }

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
                  controller: _valueController,
                  onChanged: (String value) {
                    setState(() {
                      someValue = value;
                      _valueController.text = someValue;
                      _saveOption('someValue');
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Wprowadź wartość',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  onChanged: (String value) {
                    setState(() {
                      somePassword = value;
                      _passwordController.text = somePassword;
                      _saveOption('somePassword');
                    });
                  },
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
                          _saveOption('isOn');
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
                      value: dropdownValue,
                      items: dropdownOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue ?? '';
                          _saveOption('dropdownValue');
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
                          _saveOption('isChecked');
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
                  selected: <String>{segmentedButtonValue},
                  onSelectionChanged: (Set<String> newSelection) {
                    setState(() {
                      segmentedButtonValue = newSelection.first;
                      _saveOption('segmentedButtonValue');
                    });
                  },
                ),

                const SizedBox(height: 15),

                Slider(
                    value: sliderValue,
                    onChanged: (value) {
                      setState(() {
                        sliderValue = value;
                        _saveOption('sliderValue');
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
                    bool isSelected = option == listValue;
                    return ListTile(
                      title: Text(option),
                      tileColor: isSelected ? Colors.grey.withOpacity(0.2) : null,
                      trailing: isSelected ? Icon(Icons.check, color: Colors.blue) : null,
                      onTap: () {
                        setState(() {
                          listValue = option;
                          _saveOption('listValue');
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
                    child: Text('Close'),
                  ),
                  // SizedBox(width: 12),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       _isLoading = true;
                  //     });
                  //
                  //     // _saveConfig(); //
                  //     Future.delayed(Duration(seconds: 1), () {
                  //       setState(() {
                  //         _isLoading = false;
                  //       });
                  //       Navigator.of(context).pop();
                  //     });
                  //
                  //   },
                  //   child: Text('Save'),
                  // ),
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