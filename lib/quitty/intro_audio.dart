import 'package:flutter/material.dart';
import 'package:quitter/quitty/companion_mood.dart';
import 'package:quitter/quitty/companion_voice.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Begrüßungs-Audio zum Start der Reise. Erste Person, geschlechtsneutral.
/// {N} wird durch den Namen der gewählten Version ersetzt.
const introScripts = <String, String>{
  'gitty': 'Hey. Ich bin {N}. Siehst du die Kette da? Die hatte ich auch. Und weißt du was? Der Bolzenschneider ist schwerer, als er aussieht. Aber wir tragen ihn zusammen. Heute ist Tag eins. Du musst nicht stark sein. Du musst nur anfangen. Ich bin dabei.',
  'pjotre': 'Schön, dass du da bist. Ich bin {N}. Ich habe lange hinter Rauch gelebt, und glaub mir, die Aussicht ist besser, wenn er sich verzieht. Du musst heute nichts beweisen. Nur dableiben. Ich bleibe auch. Das ist unser Geheimnis.',
  'rocco': 'Na, wen haben wir denn da! Ich bin {N}. Ich habe früher alles gesammelt, was nicht niet- und nagelfest war, und nichts davon hat gereicht. Jetzt sammle ich Tage. Lass uns gleich mit dem ersten anfangen. Ich zähle mit, versprochen.',
  'dieter': 'Komm, setz dich. Ich bin {N}. Ich habe viele Nachrichten getragen, und diese ist mir die liebste: Du schaffst das nicht allein, und du musst es auch nicht. Atme einmal tief durch. So. Der erste Tag beginnt. Ich bin bei dir.',
};

String introText(String id, CompanionGender g) =>
    (introScripts[id] ?? 'Schön, dass du da bist. Ich bin {N}.')
        .replaceAll('{N}', companionDisplayName(id, g));

class IntroAudio {
  static String _key(String habitKey) => 'quitty_intro_played_$habitKey';

  /// Spielt das Intro genau einmal pro Gewohnheit ab (Beginn der Reise).
  static Future<bool> playOnce({
    required String habitKey,
    required String companionId,
    required CompanionGender gender,
  }) async {
    final p = await SharedPreferences.getInstance();
    if (p.getBool(_key(habitKey)) ?? false) return false;
    await p.setBool(_key(habitKey), true);
    await CompanionVoice.instance.speak(introText(companionId, gender), companionId, gender);
    return true;
  }

  static Future<void> replay(String companionId, CompanionGender gender) =>
      CompanionVoice.instance.speak(introText(companionId, gender), companionId, gender);
}

class IntroCard extends StatelessWidget {
  const IntroCard({super.key, required this.companionId, required this.gender});
  final String companionId;
  final CompanionGender gender;

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF1A1A1A);
    final text = introText(companionId, gender);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ink, width: 2.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: const TextStyle(color: ink, fontSize: 16, height: 1.4, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          SpeakButton(text: text, companionId: companionId, gender: gender, label: 'Nochmal anhören'),
        ],
      ),
    );
  }
}
