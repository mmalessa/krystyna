import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/material.dart';

class SpeechDemo extends StatefulWidget {
  const SpeechDemo({super.key});

  @override
  State<SpeechDemo> createState() => _SpeechDemoState();
}

class _SpeechDemoState extends State<SpeechDemo> {
  final FlutterTts _tts = FlutterTts();
  final stt.SpeechToText _stt = stt.SpeechToText();

  String _spokenText = "Naciśnij przycisk i mów";
  bool _isListening = false;

  Future<void> _speak(String text) async {
    await _tts.setLanguage("pl-PL");
    await _tts.setSpeechRate(0.5);
    await _tts.setPitch(1.0);
    await _tts.speak(text);
  }

  Future<void> _listen() async {
    bool available = await _stt.initialize(
      onStatus: (status) {
        if (status == 'notListening') {
          setState(() => _isListening = false);
        }
      },
    );
    if (available) {
      setState(() => _isListening = true);
      await _stt.listen(
        localeId: "pl_PL",
        onResult: (result) {
          setState(() => _spokenText = result.recognizedWords);
        },
      );
    }
  }

  @override
  void dispose() {
    _tts.stop();
    _stt.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech demo'),
      ),
      body: Center(
        // padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _spokenText,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _isListening ? null : _listen,
              icon: const Icon(Icons.mic),
              label: const Text("Mów"),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => _speak(_spokenText),
              icon: const Icon(Icons.volume_up),
              label: const Text("Powiedz to"),
            ),
          ],
        ),
      )
    );
  }
}
