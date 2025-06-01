
import 'package:krystyna/voice_commands/dictionary/commands_pl.dart';

String? matchTarget(String input) {
  for (var entry in targets.entries) {
    for (var phrase in (entry.value["phrases"] as List<String>)) {
      if (input.contains(phrase)) {
        return entry.key;
      }
    }
  }
  return null;
}

String? matchAction(String input) {
  if (input.contains(commandOn)) return "toggle_on";
  if (input.contains(commandOff)) return "toggle_off";
  return null;
}

Map<String, dynamic> parseCommand(String input) {
  input = input.toLowerCase();

  if (!input.contains(triggerWord)) {
    return {"error": "Trigger word not found"};
  }

  final action = matchAction(input);
  final target = matchTarget(input);

  if (action == null || target == null) {
    return {"error": "Could not parse action or target"};
  }

  final _commandName = commandNames[action] ?? '';
  final _target = targets[target];
  String _targetName = '';
  if (_target != null) {
    _targetName = _target["response"][0];
  }

  return {
    "action": action,
    "target": target,
    "response": _commandName + " " + _targetName
  };
}
