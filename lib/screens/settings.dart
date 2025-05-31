import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:krystyna/providers/settings_provider.dart';
import 'package:krystyna/widgets/settings/settings_text_field.dart';
import 'package:krystyna/widgets/settings/settings_switch.dart';
import 'package:krystyna/config/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SettingsProvider>().loadSettings();
    });
  }

  @override
  void dispose() {
    _valueController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showPopup(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text("Zamknij"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ustawienia ogólne",
                      style: TextStyle(
                        fontSize: AppConstants.titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppConstants.defaultPadding),
                    
                    SettingsTextField(
                      label: 'Wprowadź wartość',
                      value: settings.someValue,
                      controller: _valueController,
                      onChanged: (value) => settings.updateSetting('someValue', value),
                    ),
                    
                    const SizedBox(height: AppConstants.defaultPadding),
                    
                    SettingsTextField(
                      label: 'Hasło tajemne',
                      value: settings.somePassword,
                      controller: _passwordController,
                      isPassword: !_isPasswordVisible,
                      onChanged: (value) => settings.updateSetting('somePassword', value),
                    ),
                    
                    const SizedBox(height: AppConstants.defaultPadding),
                    
                    SettingsSwitch(
                      label: 'Jakiś przełącznik',
                      value: settings.isOn,
                      onChanged: (value) => settings.updateSetting('isOn', value),
                    ),
                    
                    const SizedBox(height: AppConstants.defaultPadding),
                    
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Wybierz opcję',
                        border: OutlineInputBorder(),
                      ),
                      value: settings.dropdownValue,
                      items: SettingsProvider.dropdownOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          settings.updateSetting('dropdownValue', newValue);
                        }
                      },
                    ),
                    
                    const SizedBox(height: AppConstants.defaultPadding),
                    
                    CheckboxListTile(
                      title: const Text('Opcja do zaznaczenia'),
                      value: settings.isChecked,
                      onChanged: (bool? value) {
                        if (value != null) {
                          settings.updateSetting('isChecked', value);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}