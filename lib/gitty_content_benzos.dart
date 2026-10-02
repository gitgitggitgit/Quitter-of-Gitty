import 'package:quitter/gitty_content.dart';

GittyDay? gittyBenzosFor(String habitKey, int dayNumber) {
  if (habitKey != 'benzos') return null;
  if (dayNumber < 1 || dayNumber > _benzos.length) return null;
  return _benzos[dayNumber - 1];
}

const _benzos = <GittyDay>[
  GittyDay(
    'Abruptes oder zu schnelles Absetzen nach längerer Einnahme kann schwere Entzugsreaktionen bis zu Krampfällen auslösen.',
    'Wenn du Benzos regelmäßig genommen hast, setze sie nicht eigenmächtig von heute auf morgen ab. Besprich eine langsame Reduktion mit einer Ärztin oder einem Arzt. Bei einem Krampfanfall rufe sofort 112.',
    'Quelle: Ashton Manual (Benzodiazepine Information Coalition); FDA-Hinweis 2020, zitiert nach ashtonmanual.org',
    'Notiere Präparat, Dosis und Dauer der Einnahme und vereinbare einen ärztlichen Termin.',
  ),
  GittyDay(
    'Die Leitlinie empfiehlt, die Dosis schrittweise zu senken. Kein Schema passt für alle, der Plan wird individuell erstellt.',
    'Langsam ist kein Zeichen von Schwäche, sondern der sichere Weg.',
    'Quelle: Joint Clinical Practice Guideline on Benzodiazepine Tapering (PMC, 2025)',
    'Frage bei deinem Arzttermin nach einem persönlichen Reduktionsplan.',
  ),
  GittyDay(
    'Zu Beginn sollte die Dosis laut Leitlinie in der Regel um 5 bis 10 Prozent alle zwei bis vier Wochen sinken.',
    'Das Tempo richtet sich nach deiner Reaktion. Pausen sind erlaubt.',
    'Quelle: Joint Clinical Practice Guideline on Benzodiazepine Tapering (PMC, 2025)',
    'Lege ein einfaches Dosis-Tagebuch an: Uhrzeit, Menge, Befinden.',
  ),
  GittyDay(
    'Eine körperliche Abhängigkeit kann laut Leitlinien schon nach etwa zwei Wochen Einnahme entstehen.',
    'Das hat nichts mit Charakter zu tun. Dein Nervensystem hat sich angepasst.',
    'Quelle: Long-term neurological consequences following benzodiazepine use (PMC, 2025)',
    'Schreibe auf, seit wann du Benzos nimmst und wie sich die Dosis verändert hat.',
  ),
  GittyDay(
    'Bei kurz wirksamen Benzos dauert der akute Entzug etwa zehn Tage, bis der Rest des Wirkstoffs abgebaut ist.',
    'Es kommt auf den Wirkstoff an, deshalb ist es wichtig zu wissen, welches Präparat du nimmst.',
    'Quelle: Enduring neurological sequelae of benzodiazepine use (SAGE, 2023)',
    'Finde mit dem Beipackzettel oder in der Apotheke heraus, wie lange dein Wirkstoff wirkt.',
  ),
  GittyDay(
    'Bei lang wirksamen Benzos kann das Ausleiten bis zu etwa 28 Tage dauern.',
    'Beschwerden können später beginnen und länger anhalten als bei kurz wirksamen.',
    'Quelle: Enduring neurological sequelae of benzodiazepine use (SAGE, 2023)',
    'Plane in den nächsten Wochen möglichst wenige Termine mit hoher Belastung.',
  ),
  GittyDay(
    'Typische Entzugszeichen sind Schlafstörungen, Reizbarkeit, Anspannung, Angst, Zittern, Schwitzen und Konzentrationsprobleme.',
    'Vieles davon ist Entzug und nicht deine alte Angst, die zurückkehrt. Besprich es trotzdem mit deinem Arzt oder deiner Ärztin.',
    'Quelle: Benzodiazepine withdrawal syndrome (Wikipedia, Zusammenfassung von Fachliteratur)',
    'Notiere heute deine drei stärksten Beschwerden mit einer Zahl von 0 bis 10.',
  ),
  GittyDay(
    'Der akute Entzug dauert meist ein bis drei Wochen. Bei kurz wirksamen liegt der Höhepunkt oft an Tag 2 bis 5, bei lang wirksamen an Tag 5 bis 7.',
    'Die Zeitangaben sind Richtwerte. Jeder Verlauf ist anders.',
    'Quelle: RehabPulse, Benzodiazepine Withdrawal Timeline (Ratgeberseite)',
    'Plane ruhige Tage ein und fährst du Auto, kläre vorher mit deinem Arzt, ob das gerade sicher ist.',
  ),
  GittyDay(
    'Nach dem Absetzen kommt es häufig zu Rebound-Schlaflosigkeit und manchmal zu Albträumen.',
    'Es kann Monate dauern, bis sich ein normales Schlafprofil wieder einstellt.',
    'Quelle: Protracted Withdrawal From Benzodiazepines (benzo.org.uk)',
    'Gehe zur gleichen Zeit ins Bett und meide ab Mittag Kaffee.',
  ),
  GittyDay(
    'Manche Beschwerden treten Stunden nach der Dosis auf und bessern sich mit der nächsten. Das nennt man Interdose-Entzug.',
    'Solche Täler zwischen den Dosen sind ein Hinweis, dass dein Körper abhängig reagiert.',
    'Quelle: ashtonmanual.org, What is the Ashton Protocol?',
    'Notiere, zu welchen Uhrzeiten Beschwerden steigen, und zeige es deinem Arzt.',
  ),
  GittyDay(
    'Das Ashton Manual schlägt vor, die Dosis um bis zu ein Zehntel pro Schritt alle ein bis zwei Wochen zu senken.',
    'Das ist ein bekanntes Modell. Dein Plan sollte trotzdem mit einer Fachperson abgestimmt sein.',
    'Quelle: ashtonmanual.org, What is the Ashton Protocol?',
    'Frage, ob eine Umstellung auf ein lang wirksames Mittel für dich sinnvoll sein könnte.',
  ),
  GittyDay(
    'Das Ashton-Protokoll ist die bekannteste Methode, aber kein offizieller medizinischer Standard.',
    'Es beruht auf klinischer Erfahrung. Leitlinien und Ärzte beziehen sich teils darauf.',
    'Quelle: ashtonmanual.org, What is the Ashton Protocol?',
    'Bringe zum nächsten Termin eine Frage zu Ashton und zur Leitlinie mit.',
  ),
  GittyDay(
    'Ein Taper kann Monate dauern, nach langer Einnahme manchmal ein Jahr oder länger.',
    'Zwei Wochen sind ein Anfang, kein Ziel. Du brauchst Geduld, nicht Perfektion.',
    'Quelle: AddictionHelp, How to Taper Off Benzodiazepines',
    'Setze dir Monatsziele statt täglichem Druck.',
  ),
  GittyDay(
    'Symptome verlaufen oft in Wellen, mit Fenstern der Normalität dazwischen, die mit der Zeit länger werden.',
    'Eine schlechte Welle heißt nicht, dass du zurückfällst.',
    'Quelle: Protracted Withdrawal From Benzodiazepines (benzo.org.uk)',
    'Markiere gute Tage im Kalender. Sie werden mehr.',
  ),
  GittyDay(
    'Angst nimmt nach dem Absetzen schrittweise ab und kann sich über etwa ein Jahr zurückbilden.',
    'Die Besserung ist oft nicht gerade, aber der Verlauf geht in die richtige Richtung.',
    'Quelle: Benzodiazepine Information Coalition, Protracted Withdrawal Syndrome',
    'Mache heute eine Atemübung: vier Sekunden ein, sechs Sekunden aus, zehn Mal.',
  ),
  GittyDay(
    'Depression kann nach dem Absetzen einige Monate anhalten. Suizidgedanken werden als mögliches Symptom beschrieben.',
    'Wenn dunkle Gedanken kommen, wende dich sofort an die Telefonseelsorge unter 0800 111 0 111 oder den Notruf 112.',
    'Quelle: Benzodiazepine Information Coalition; Long-term neurological consequences (PMC, 2025)',
    'Speichere die Nummern 0800 111 0 111 und 112 jetzt in deinem Handy.',
  ),
  GittyDay(
    'Schlaflosigkeit bessert sich meist über sechs bis zwölf Monate schrittweise.',
    'Dass du heute schlecht schläfst, sagt nichts über den Verlauf in Monaten.',
    'Quelle: Benzodiazepine Information Coalition, Protracted Withdrawal Syndrome',
    'Verzichte heute Abend auf Bildschirme in der letzten Stunde vor dem Schlafen.',
  ),
  GittyDay(
    'In einer Online-Befragung berichteten mindestens 85 Prozent der Betroffenen Nervosität oder Angst, Schlafstörungen, wenig Energie und Konzentrationsprobleme.',
    'Die Befragung war nicht repräsentativ, zeigt aber, wie verbreitet diese Beschwerden sind. Du bist nicht allein damit.',
    'Quelle: Enduring neurological sequelae of benzodiazepine use (SAGE, 2023)',
    'Suche eine Selbsthilfegruppe oder ein Forum mit ärztlicher Moderation.',
  ),
  GittyDay(
    'Kurzfristige Symptome klangen in Tagen oder Wochen ab, langfristige brauchten Monate bis ein Jahr oder länger.',
    'Dein Tempo darf langsamer sein als das von anderen.',
    'Quelle: Enduring neurological sequelae of benzodiazepine use (SAGE, 2023)',
    'Vergleiche dich heute nicht mit anderen, sondern mit deinem Stand von vor einer Woche.',
  ),
  GittyDay(
    'Je nach Studie berichten 10 bis 44 Prozent der Langzeitnutzenden mittelschwere bis schwere Symptome, die Monate bis Jahre anhalten.',
    'Die Spanne ist groß, weil die Studienlage uneinheitlich ist. Die Mehrheit erholt sich.',
    'Quelle: CoRx Consortium, Benzodiazepine-Induced Brain Injury (Präsentation, 2018, schwächere Quelle)',
    'Sprich mit deinem Arzt über Warnzeichen, auf die du achten sollst.',
  ),
  GittyDay(
    'Anhaltende Symptome können laut Leitlinien schon etwa vier Wochen nach dem Absetzen auftreten.',
    'Wenn Beschwerden nach vier Wochen bleiben, ist das ein bekanntes Muster und kein Zeichen, dass du etwas falsch machst.',
    'Quelle: Long-term neurological consequences following benzodiazepine use (PMC, 2025)',
    'Dokumentiere, welche Beschwerden bleiben und wie stark sie sind.',
  ),
  GittyDay(
    'Berichtet werden auch Tinnitus, Kribbeln, Taubheit und Muskelschmerzen.',
    'Lass neue oder starke körperliche Beschwerden ärztlich abklären, statt allein zu raten.',
    'Quelle: Benzodiazepine withdrawal syndrome (Wikipedia, Zusammenfassung); Benzodiazepine Information Coalition',
    'Vereinbare einen Arzttermin für Beschwerden, die dich beunruhigen.',
  ),
  GittyDay(
    'Auch Magen-Darm-Beschwerden können länger anhalten und bessern sich schrittweise über ein Jahr oder mehr.',
    'Dein Magen reagiert oft auf Stress und Umstellung.',
    'Quelle: Benzodiazepine Information Coalition, Protracted Withdrawal Syndrome',
    'Iss leichte, regelmäßige Mahlzeiten und trinke genug Wasser.',
  ),
  GittyDay(
    'Konzentration und Gedächtnis erholen sich schrittweise über ein Jahr oder länger.',
    'Nebel im Kopf ist ein bekannter Teil der Erholung.',
    'Quelle: Benzodiazepine Information Coalition, Protracted Withdrawal Syndrome',
    'Schreibe Termine und Aufgaben auf, statt dich auf dein Gedächtnis zu verlassen.',
  ),
  GittyDay(
    'Die Leitlinie fordert laufende Begleitung und Kontrolle während der Reduktion.',
    'Du musst es nicht allein schaffen. Begleitung gilt als Teil der Sicherheit.',
    'Quelle: Joint Clinical Practice Guideline on Benzodiazepine Tapering (PMC, 2025)',
    'Vereinbare regelmäßige Kontrolltermine, zum Beispiel alle zwei bis vier Wochen.',
  ),
  GittyDay(
    'Bei erhöhtem Krampfrisiko empfiehlt die Leitlinie ein langsameres Tempo und einen klaren Notfallplan.',
    'Sag deinem Arzt, wenn du früher Krampfälle hattest oder zusätzlich Alkohol trinkst.',
    'Quelle: Joint Clinical Practice Guideline on Benzodiazepine Tapering (PMC, 2025)',
    'Informiere eine Person, wie sie bei einem Krampfanfall reagieren soll: 112 rufen.',
  ),
  GittyDay(
    'Ein Krampfanfall ist ein medizinischer Notfall. Bei langsamer Reduktion ist er laut Ashton Manual sehr selten.',
    'Das Risiko sinkt mit der Geschwindigkeit der Reduktion, und genau dort hast du Einfluss.',
    'Quelle: ashtonmanual.org; Ashton Manual (Benzodiazepine Information Coalition)',
    'Halte dein Tempo und ändere die Dosis nie ohne Absprache.',
  ),
  GittyDay(
    'Zu schnelles Reduzieren kann Rebound-Angst, Schlafstörungen, Zittern, Reizbarkeit sowie Licht- und Lärmempfindlichkeit auslösen.',
    'Wenn Reize zu viel werden, ist das ein Zeichen, das Tempo zu überprüfen.',
    'Quelle: ashtonmanual.org, Benzodiazepine Taper Calculator',
    'Dimme heute das Licht und halte den Abend ruhig.',
  ),
  GittyDay(
    'Die Forschung zu Langzeitfolgen ist begrenzt und stützt sich teils auf Online-Befragungen.',
    'Was gesichert ist: Langsame, begleitete Reduktion gilt als sicherster Weg.',
    'Quelle: Long-term neurological consequences following benzodiazepine use (PMC, 2025)',
    'Schreibe drei Fragen auf, die du bei deinem nächsten Termin stellen willst.',
  ),
  GittyDay(
    'Ein Monat: Eine Reduktion oder Abstinenz ist ein Prozess, der meist Monate dauert.',
    'Du hast eine erste Etappe geschafft. Das zählt, auch wenn noch Beschwerden bleiben.',
    'Quelle: Joint Clinical Practice Guideline on Benzodiazepine Tapering (PMC, 2025); ashtonmanual.org',
    'Besprich mit deinem Arzt den nächsten Schritt und belohne dich heute mit etwas Gutem.',
  ),
];
