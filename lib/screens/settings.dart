import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:krystyna/providers/settings_provider.dart';
import 'package:krystyna/widgets/settings/settings_text_field.dart';
import 'package:krystyna/widgets/settings/settings_switch.dart';
import 'package:krystyna/widgets/language_selector.dart';
import 'package:krystyna/config/constants.dart';
import 'package:krystyna/generated/app_localizations.dart';

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
              child: Text(AppLocalizations.of(context)?.close ?? 'Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    return Consumer<SettingsProvider>(
      builder: (context, settings, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(localizations?.settings ?? 'Settings'),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localizations?.generalSettings ?? 'General Settings',
                      style: const TextStyle(
                        fontSize: AppConstants.titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppConstants.defaultPadding),
                    
                    const LanguageSelector(),
                    
                    const SizedBox(height: AppConstants.defaultPadding),
                    
                    SettingsTextField(
                      label: localizations?.enterValue ?? 'Enter value',
                      value: settings.someValue,
                      controller: _valueController,
                      onChanged: (value) => settings.updateSetting('someValue', value),
                    ),
                    
                    const SizedBox(height: AppConstants.defaultPadding),
                    
                    SettingsTextField(
                      label: localizations?.secretPassword ?? 'Secret password',
                      value: settings.somePassword,
                      controller: _passwordController,
                      isPassword: !_isPasswordVisible,
                      onChanged: (value) => settings.updateSetting('somePassword', value),
                    ),
                    
                    const SizedBox(height: AppConstants.defaultPadding),
                    
                    SettingsSwitch(
                      label: localizations?.someSwitch ?? 'Some switch',
                      value: settings.isOn,
                      onChanged: (value) => settings.updateSetting('isOn', value),
                    ),
                    
                    const SizedBox(height: AppConstants.defaultPadding),
                    
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: localizations?.selectOption ?? 'Select option',
                        border: const OutlineInputBorder(),
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
                      title: Text(localizations?.checkboxOption ?? 'Checkbox option'),
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