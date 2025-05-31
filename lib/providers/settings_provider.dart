import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  bool _isOn = false;
  bool _isChecked = false;
  String _segmentedButtonValue = 'sec';
  double _sliderValue = 0.7;
  String _someValue = '';
  String _somePassword = '';
  String _dropdownValue = 'Opcja 3';
  String _listValue = 'Opcja 1';

  // Getters
  bool get isOn => _isOn;
  bool get isChecked => _isChecked;
  String get segmentedButtonValue => _segmentedButtonValue;
  double get sliderValue => _sliderValue;
  String get someValue => _someValue;
  String get somePassword => _somePassword;
  String get dropdownValue => _dropdownValue;
  String get listValue => _listValue;

  static const List<String> dropdownOptions = ['Opcja 1', 'Opcja 2', 'Opcja 3'];
  static const List<String> listOptions = [
    'Opcja 1',
    'Opcja 2',
    'Opcja 3',
    'Opcja 4',
    'Opcja 5',
    'Opcja 6',
  ];

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    
    _isOn = prefs.getBool('isOn') ?? false;
    _isChecked = prefs.getBool('isChecked') ?? false;
    _sliderValue = prefs.getDouble('sliderValue') ?? 0.7;
    _segmentedButtonValue = prefs.getString('segmentedButtonValue') ?? 'sec';
    _dropdownValue = prefs.getString('dropdownValue') ?? dropdownOptions[0];
    _listValue = prefs.getString('listValue') ?? listOptions[0];
    _someValue = prefs.getString('someValue') ?? '';
    _somePassword = prefs.getString('somePassword') ?? '';
    
    notifyListeners();
  }

  Future<void> updateSetting<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    
    switch (T) {
      case bool:
        await prefs.setBool(key, value as bool);
        break;
      case double:
        await prefs.setDouble(key, value as double);
        break;
      case String:
        await prefs.setString(key, value as String);
        break;
      default:
        throw Exception('Unsupported type for settings: ${T.toString()}');
    }

    switch (key) {
      case 'isOn':
        _isOn = value as bool;
        break;
      case 'isChecked':
        _isChecked = value as bool;
        break;
      case 'sliderValue':
        _sliderValue = value as double;
        break;
      case 'segmentedButtonValue':
        _segmentedButtonValue = value as String;
        break;
      case 'dropdownValue':
        _dropdownValue = value as String;
        break;
      case 'listValue':
        _listValue = value as String;
        break;
      case 'someValue':
        _someValue = value as String;
        break;
      case 'somePassword':
        _somePassword = value as String;
        break;
    }
    
    notifyListeners();
  }
} 