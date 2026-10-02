import 'package:quitter/quitty/companion_mood.dart';
import 'package:quitter/quitty/companion_voice.dart';

enum VoiceMoment { milestone, craving, relapse }

/// Tokens: {N} Name der Figur, {days} Anzahl Tage.
/// Craving-Texte folgen dem 4-6-Atemrhythmus (4 Sek. ein, 6 Sek. aus).
const momentScripts = <String, Map<String, String>>{
  'gitty': {
    'milestone': '{days} Tage, {N} hier! Weißt du noch, wie schwer die Kette am Anfang war? Schau, wie viele Glieder schon hinter dir liegen. Das warst du. Ganz allein du. Ich bin verdammt stolz auf dich.',
    'craving': 'Ich bin da. Der Drang kommt wie ein Zug, laut und grell. Aber Züge fahren weiter. Atme mit mir. Vier Sekunden ein. Und sechs Sekunden aus. Nochmal. Ein. Und aus. Du musst nichts tun, nur warten. Es wird leiser. Du schaffst die nächsten Minuten.',
    'relapse': 'Hey, komm her. Es ist passiert. Das ist kein Weltuntergang und du bist nicht am Anfang. Die Glieder, die du gebrochen hast, bleiben gebrochen. Heute ist ein schlechter Tag, nicht dein ganzes Leben. Steh auf, ich halte dir die Hand hin.',
  },
  'pjotre': {
    'milestone': '{days} Tage. Wer hätte das gedacht, außer mir. Ich habe es immer gewusst, auch wenn ich es nie gesagt habe. Der Vorhang ist weg, und du siehst klar. Das ist dein Verdienst. Nur deins.',
    'craving': 'Ganz ruhig. Ich bin bei dir. Der Drang ist nur Rauch, er sieht groß aus und löst sich auf. Atme ein, vier Sekunden. Halte kurz. Und aus, sechs Sekunden, ganz langsam. Noch einmal. Spürst du, wie der Nebel sich lichtet?',
    'relapse': 'Ich verurteile dich nicht. Ich kenne das Gefühl, mich hinter Scham zu verstecken, und es hilft nie. Erzähl mir, was passiert ist, oder schweig, wenn du magst. Ich bleibe sitzen. Morgen ist ein neuer Tag, und der gehört dir.',
  },
  'rocco': {
    'milestone': '{days} Tage! Ich habe mitgezählt! Das ist mehr wert als alle Knöpfe der Welt. Und das Beste: Dir kann es keiner mehr wegnehmen. Das ist dein Schatz. Gratuliere!',
    'craving': 'Okay, okay, ich weiß, es zieht in den Fingern. Lass uns die Hände beschäftigen. Atme tief ein, vier Sekunden. Und lang aus, sechs Sekunden. Drück die Fäuste, lass sie los. Nochmal atmen. Trink ein Glas Wasser. Die Welle ist gleich vorbei, versprochen.',
    'relapse': 'Ach, Mensch. Das war ein Ausrutscher, kein Absturz. Ich weiß, wie sich das anfühlt, ich habe auch schon Mist gebaut. Schüttel dich, wasch dir das Gesicht, und dann machen wir weiter. Ein Fehler löscht nicht die Tage, die du geschafft hast.',
  },
  'dieter': {
    'milestone': '{days} Tage. Ich habe viele Nachrichten getragen, aber diese hier freut mich am meisten: Du hast es geschafft, bis hierher. Atme einmal tief durch und spür, wie weit du gekommen bist. Gut gemacht, mein Freund.',
    'craving': 'Setz dich, ich bin bei dir. Der Drang kommt und geht, wie der Wind. Wir warten, bis er weiterzieht. Atme ein, vier Sekunden. Halte. Und langsam aus, sechs Sekunden. Gut so. Noch einmal. Du bist nicht allein, ich bleibe hier.',
    'relapse': 'Komm, setz dich zu mir. Es ist passiert, und das ist in Ordnung. Du bist kein Versager, du bist ein Mensch auf einem langen Weg. Wir schauen jetzt nicht zurück, sondern auf den nächsten Schritt. Und den gehen wir gemeinsam.',
  },
};

String momentText(String id, CompanionGender g, VoiceMoment m, {int days = 0}) {
  final t = momentScripts[id]?[m.name] ?? '';
  return t
      .replaceAll('{N}', companionDisplayName(id, g))
      .replaceAll('{days}', '$days');
}

Future<void> speakMoment(String id, CompanionGender g, VoiceMoment m, {int days = 0}) =>
    CompanionVoice.instance.speak(momentText(id, g, m, days: days), id, g);
