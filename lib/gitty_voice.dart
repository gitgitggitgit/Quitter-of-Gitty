String gittyVoiceLine({
  required String companionId,
  required int dayNumber,
  required String saved,
}) {
  final female = companionId.endsWith('_w');
  final base = female
      ? companionId.substring(0, companionId.length - 2)
      : companionId;
  final phase = dayNumber <= 1
      ? 0
      : dayNumber < 7
          ? 1
          : dayNumber < 30
              ? 2
              : 3;
  final money = saved.isEmpty ? '' : ' $saved sind schon zur Seite gelegt.';
  final bird = female ? 'eine verpeilte Taube' : 'einen verpeilten Vogel';

  switch (base) {
    case 'taube':
      return [
        'Erster Tag, Plattenspieler aus, Kopf an. Das kriegen wir hin.',
        'Tag $dayNumber. Der Takt kommt langsam zurück.$money',
        'Tag $dayNumber und noch immer auf Sendung. Nicht schlecht für $bird.$money',
        'Tag $dayNumber. Ich höre wieder jedes Detail im Beat, und du hörst dich auch wieder.$money',
      ][phase];
    case 'ratte':
      return [
        'Tag eins. Kette ist durch, jetzt gehen wir raus.',
        'Tag $dayNumber. Die ersten Tage sind der härteste Zaun. Wir klettern noch, aber ich hab deinen Rücken!$money',
        'Tag $dayNumber. Der erste Zaun liegt hinter uns. Weiter geht es, Schritt für Schritt.$money',
        'Tag $dayNumber. Ich habe schon ganz andere Schlösser geknackt, du auch.$money',
      ][phase];
    case 'fuchs':
      return [
        'Tag eins. Ich sag nichts, ich schaue nur zu.',
        'Tag $dayNumber. Du hältst durch, das bleibt unter uns.$money',
        'Tag $dayNumber. Ich habe schon viele aufgeben sehen, du gehörst bisher nicht dazu.$money',
        'Tag $dayNumber. Langsam wird es unheimlich ruhig, genau so mag ich es.$money',
      ][phase];
    case 'waschbaer':
      return [
        'Tag eins! Ich habe die Taschenlampe, du den Mut.',
        'Tag $dayNumber. Es wird heller, ich sehe schon die Wand dort hinten, glaube ich.$money',
        'Tag $dayNumber! Ich sammle deine Erfolge, meine Taschen sind schon voll.$money',
        'Tag $dayNumber. Ich habe das Licht gefunden und es gehört dir.$money',
      ][phase];
  }
  return 'Tag $dayNumber.$money';
}
