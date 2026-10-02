import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:quitter/quitty/companion_mood.dart';

class VoiceProfile {
  const VoiceProfile(this.pitch, this.rate);
  final double pitch;
  final double rate;
}

const voiceProfiles = <String, Map<CompanionGender, VoiceProfile>>{
  'gitty': {
    CompanionGender.male: VoiceProfile(0.85, 0.50),
    CompanionGender.female: VoiceProfile(1.15, 0.50),
  },
  'pjotre': {
    CompanionGender.male: VoiceProfile(0.70, 0.42),
    CompanionGender.female: VoiceProfile(0.95, 0.42),
  },
  'rocco': {
    CompanionGender.male: VoiceProfile(1.10, 0.55),
    CompanionGender.female: VoiceProfile(1.40, 0.55),
  },
  'dieter': {
    CompanionGender.male: VoiceProfile(0.75, 0.38),
    CompanionGender.female: VoiceProfile(1.00, 0.38),
  },
};

class CompanionVoice {
  CompanionVoice._();
  static final CompanionVoice instance = CompanionVoice._();

  final FlutterTts _tts = FlutterTts();
  bool _ready = false;
  final ValueNotifier<bool> speaking = ValueNotifier(false);

  Future<void> _init() async {
    if (_ready) return;
    await _tts.setLanguage('de-DE');
    await _tts.setVolume(1.0);
    _tts.setCompletionHandler(() => speaking.value = false);
    _tts.setCancelHandler(() => speaking.value = false);
    _tts.setErrorHandler((_) => speaking.value = false);
    _ready = true;
  }

  // Android und iOS interpretieren die Rate unterschiedlich: auf Geraeten testen.
  double _rate(double r) => Platform.isAndroid ? r : r * 0.8;

  Future<void> speak(String text, String id, CompanionGender g) async {
    await _init();
    await _tts.stop();
    final p = voiceProfiles[id]?[g] ?? const VoiceProfile(1.0, 0.45);
    await _tts.setPitch(p.pitch);
    await _tts.setSpeechRate(_rate(p.rate));
    speaking.value = true;
    await _tts.speak(text);
  }

  Future<void> stop() async {
    await _tts.stop();
    speaking.value = false;
  }
}

class SpeakButton extends StatelessWidget {
  const SpeakButton({
    super.key,
    required this.text,
    required this.companionId,
    required this.gender,
    this.label = 'Vorlesen',
  });

  final String text;
  final String companionId;
  final CompanionGender gender;
  final String label;

  @override
  Widget build(BuildContext context) {
    final v = CompanionVoice.instance;
    return ValueListenableBuilder<bool>(
      valueListenable: v.speaking,
      builder: (context, playing, _) => TextButton.icon(
        onPressed: () => playing ? v.stop() : v.speak(text, companionId, gender),
        icon: Icon(playing ? Icons.stop_circle_outlined : Icons.volume_up_outlined),
        label: Text(playing ? 'Stopp' : label),
      ),
    );
  }
}
