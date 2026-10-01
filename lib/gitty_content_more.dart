import 'package:quitter/gitty_content.dart';

GittyDay? gittyDayAnyFor(String habitKey, int dayNumber) {
  final base = gittyDayFor(habitKey, dayNumber);
  if (base != null) return base;
  final track = switch (habitKey) {
    'marijuana' => _cannabis2,
    'smoking' || 'nicotine_pouches' || 'smokeless_tobacco' => _nicotine2,
    'vaping' => _vaping2,
    'cocaine' => _cocaine2,
    'alcohol' => _alcohol2,
    'social_media' => _social2,
    'pornography' => _porn2,
    _ => null,
  };
  final i = dayNumber - 8;
  if (track == null || i < 0 || i >= track.length) return null;
  return track[i];
}

const _cannabis2 = <GittyDay>[
  GittyDay(
    'Eine Übersichtsarbeit fand schon in der ersten Woche nach dem Stopp Verbesserungen bei kognitiven Tests.',
    'Dein Kopf erholt sich schneller, als viele denken. Aufmerksamkeit und Planen brauchen allerdings länger.',
    'Quelle: Cannabis cessation and neurocognitive recovery (Übersichtsarbeit, American Journal on Addictions, 2026)',
    'Erledige heute eine Aufgabe, die Konzentration braucht, und merke dir, wie es lief.',
  ),
  GittyDay(
    'Bei 16- bis 26-Jährigen erholte sich die anhaltende Aufmerksamkeit nach zwei Wochen überwachter Abstinenz.',
    'Die Teilnehmenden waren jung. Bei dir kann der Verlauf anders sein.',
    'Quelle: Impact of Two-Weeks of Monitored Abstinence on Cognition (PMC, 2020)',
    'Arbeite heute zehn Minuten an einer Aufgabe, ohne aufs Handy zu schauen.',
  ),
  GittyDay(
    'Verbales Lernen und Gedächtnis erholen sich laut Studienlage nach ein bis zwei Wochen Abstinenz.',
    'Namen, Gespräche und neue Informationen sollten jetzt besser hängen bleiben.',
    'Quelle: Impact of Two-Weeks of Monitored Abstinence on Cognition (PMC, 2020)',
    'Lerne heute etwas Neues, zum Beispiel zehn Wörter einer Sprache.',
  ),
  GittyDay(
    'Defizite bei anhaltender und gezielter Aufmerksamkeit sowie bei der Impulskontrolle hielten in Studien mindestens drei bis vier Wochen an.',
    'Wenn du dich noch zerstreut fühlst, ist das erwartbar und kein Rückschritt.',
    'Quelle: Impact of Two-Weeks of Monitored Abstinence on Cognition (PMC, 2020)',
    'Plane heute eine Aufgabe in Etappen von 25 Minuten mit kurzen Pausen.',
  ),
  GittyDay(
    'Der Cannabis-Rezeptor CB1 im Gehirn normalisiert sich laut Übersichtsarbeit innerhalb von vier Wochen.',
    'Dein Gehirn baut Schritt für Schritt zurück, was der Konsum verstellt hat.',
    'Quelle: Cannabis cessation and neurocognitive recovery (American Journal on Addictions, 2026)',
    'Bewege dich heute 30 Minuten an der frischen Luft.',
  ),
  GittyDay(
    'In einer Vier-Wochen-Studie lagen Jugendliche, die abstinent blieben, bei Gedächtnis und Verarbeitungstempo am Ende auf dem Niveau von Nichtkonsumierenden.',
    'Wer weiter wie gewohnt konsumierte, schnitt bei verbalem Abruf und Tempo deutlich schlechter ab.',
    'Quelle: Neurocognitive outcomes in adolescents with and without four weeks of cannabis abstinence (PMC, 2025)',
    'Rechne aus, wie viel Zeit und Geld dir ohne Konsum bleiben, und plane etwas damit.',
  ),
  GittyDay(
    'Gereiztheit, Wut und gedrückte Stimmung erreichen laut Fachartikel oft nach etwa zwei Wochen ihren Höhepunkt.',
    'Zwei Wochen sind geschafft. Falls es jetzt noch einmal schwer wird, ist das typisch, danach geht es meist bergauf.',
    'Quelle: Clinical management of cannabis withdrawal (Fachartikel, PMC 2022)',
    'Belohne dich heute bewusst für zwei Wochen.',
  ),
];

const _nicotine2 = <GittyDay>[
  GittyDay(
    'Nach etwa 72 Stunden fällt das Atmen leichter, weil sich die Bronchien entspannen. Geschmack und Geruch verbessern sich.',
    'Dein Körper räumt sichtbar auf. Das ist die Belohnung, die man merkt.',
    'Quelle: ASH, Stopping Smoking',
    'Atme heute bewusst tief durch und achte darauf, was du wieder riechst und schmeckst.',
  ),
  GittyDay(
    'Zwei bis zwölf Wochen nach dem Rauchstopp verbessert sich die Durchblutung.',
    'Gehen, Treppensteigen und Laufen werden dadurch leichter.',
    'Quelle: NHS, Better Health: Quit smoking',
    'Gehe heute 20 Minuten zügig.',
  ),
  GittyDay(
    'Laut dem irischen Gesundheitsdienst HSE kann die Lungenkapazität nach zwei bis drei Monaten um bis zu 30 Prozent steigen, laut NHS sind es nach drei bis neun Monaten bis zu 10 Prozent.',
    'Die Zahlen unterscheiden sich je nach Quelle. Beide gehen in dieselbe Richtung: besser.',
    'Quelle: HSE, Health benefits of stopping smoking; NHS, Better Health',
    'Steige heute Treppen statt den Aufzug zu nehmen.',
  ),
  GittyDay(
    'Konzentrationsprobleme bessern sich, wenn sich das Gehirn an weniger Nikotin gewöhnt.',
    'Die Nebel-Phase ist vorübergehend.',
    'Quelle: HSE, Health benefits of stopping smoking',
    'Erledige heute eine Aufgabe, die Konzentration braucht.',
  ),
  GittyDay(
    'Blutdruck und Herzfrequenz sinken, und die Energie steigt.',
    'Dein Kreislauf muss nicht mehr gegen das Nikotin arbeiten.',
    'Quelle: HSE, Health benefits of stopping smoking',
    'Miss heute deinen Ruhepuls und notiere ihn.',
  ),
  GittyDay(
    'Husten, Keuchen und Atemprobleme gehen in den Monaten nach dem Stopp zurück, die Lungenfunktion steigt nach drei bis neun Monaten um bis zu 10 Prozent.',
    'Manche husten anfangs mehr, weil die Lunge sich reinigt. Das ist normal.',
    'Quelle: NHS, Better Health: Quit smoking',
    'Lege heute das Geld zur Seite, das du nicht ausgegeben hast.',
  ),
  GittyDay(
    'Zwei Wochen: Du bist mitten im Zeitfenster von zwei bis zwölf Wochen, in dem sich die Durchblutung verbessert.',
    'Das merkst du oft beim Gehen und beim Treppensteigen.',
    'Quelle: NHS, Better Health: Quit smoking',
    'Rechne aus, was du in zwei Wochen gespart hast, und gönne dir davon etwas.',
  ),
];

const _vaping2 = <GittyDay>[
  GittyDay(
    'Konzentrationsprobleme bessern sich, wenn sich das Gehirn an weniger Nikotin gewöhnt.',
    'Die Angabe stammt aus Daten zum Rauchstopp. Das Prinzip gilt auch für Nikotin aus dem Vape, ist dort aber weniger erforscht.',
    'Quelle: HSE, Health benefits of stopping smoking',
    'Erledige heute eine Aufgabe, die Konzentration braucht.',
  ),
  GittyDay(
    'Negative Gefühle durch den Nikotinentzug erreichen innerhalb einer Woche ihren Gipfel und können zwei bis vier Wochen anhalten.',
    'Reizbarkeit und Frust sind Entzug, keine Charakterfrage.',
    'Quelle: National Cancer Institute, Tips for Coping with Nicotine Withdrawal',
    'Sag deinem Umfeld, dass du gerade empfindlicher bist, und bitte um Nachsicht.',
  ),
  GittyDay(
    'Die Entzugssymptome klingen beim Vape-Stopp typischerweise innerhalb von zwei bis vier Wochen ab.',
    'Wellen von Verlangen können dazwischen noch kommen, werden aber seltener.',
    'Quelle: ScienceInsights, What to expect when you quit vaping',
    'Beobachte, zu welchen Uhrzeiten dein Verlangen kommt, und notiere sie.',
  ),
  GittyDay(
    'Zwischen zwei und zwölf Wochen nach dem Rauchstopp verbessert sich die Durchblutung.',
    'Die Zahl stammt aus Daten zum Rauchstopp. Wer vorher gedampft hat, profitiert vermutlich ähnlich, belegt ist das aber weniger gut.',
    'Quelle: NHS, Better Health: Quit smoking',
    'Gehe heute 20 Minuten zügig.',
  ),
  GittyDay(
    'Blutdruck und Herzfrequenz sinken, und die Energie steigt in den Wochen nach dem Rauchstopp.',
    'Auch hier gilt: Die Daten stammen vom Rauchen, bei Vapes ist die Studienlage dünner.',
    'Quelle: HSE, Health benefits of stopping smoking',
    'Miss heute deinen Ruhepuls und notiere ihn.',
  ),
  GittyDay(
    'Die Nikotinrezeptoren im Gehirn stellen sich zwischen Tag 14 und 21 laut ScienceInsights wieder auf das Niveau von Nichtrauchern ein.',
    'Bis dahin schwankt das Verlangen noch.',
    'Quelle: ScienceInsights, What to expect when you quit vaping',
    'Plane die nächste Woche: Wann bist du am stärksten gefährdet?',
  ),
  GittyDay(
    'Zwei Wochen: Von Tag vier bis 14 lassen die Symptome nach.',
    'Du hast die zweite Hälfte des Weges durch den akuten Entzug geschafft.',
    'Quelle: ScienceInsights, What to expect when you quit vaping',
    'Rechne aus, was du in zwei Wochen gespart hast, und gönne dir davon etwas.',
  ),
];

const _cocaine2 = <GittyDay>[
  GittyDay(
    'Der Dopamintransporter beginnt sich laut einer Entzugsübersicht innerhalb von ein bis zwei Wochen zu normalisieren.',
    'Dein Gehirn fährt das Belohnungssystem langsam wieder hoch.',
    'Quelle: Archangel Centers, Cocaine Withdrawal Timeline (Behandlungszentrum)',
    'Plane heute zwei feste Mahlzeiten und gehe vor 23 Uhr ins Bett.',
  ),
  GittyDay(
    'In den ersten ein bis zwei Wochen verlangsamen sich Denken, Aufmerksamkeit und Entscheidungen durch den Dopaminmangel.',
    'Wenn du dich zäh fühlst, liegt das am Entzug und nicht an dir.',
    'Quelle: Archangel Centers, Cocaine Withdrawal Timeline (Behandlungszentrum)',
    'Schreibe Aufgaben heute auf, statt sie im Kopf zu halten.',
  ),
  GittyDay(
    'Die Freudlosigkeit hängt mit weniger D2- und D3-Rezeptoren zusammen. Sie erholen sich bei den meisten in vier bis zwölf Wochen.',
    'Dass sich nichts gut anfühlt, ist ein bekannter Teil der Erholung und geht vorbei.',
    'Quelle: Archangel Centers, Cocaine Withdrawal Timeline (Behandlungszentrum)',
    'Plane etwas, das ohne Kick Freude machen kann: Essen, Musik oder Bewegung.',
  ),
  GittyDay(
    'In Tierversuchen mit Primaten erholte sich die D2-Rezeptor-Verfügbarkeit nach kurzem Konsum innerhalb von ein bis drei Wochen, nach langem Konsum nicht.',
    'Tierstudien sind kein Beweis für Menschen. Sie zeigen aber, dass sich das Gehirn erholen kann.',
    'Quelle: Recovering from Cocaine: Clinical and Preclinical Insights (PMC, 2013)',
    'Erinnere dich an einen Moment, in dem du dich ohne Konsum gut gefühlt hast, und schreibe ihn auf.',
  ),
  GittyDay(
    'Die Funktion des Stirnhirns, zuständig für Impulskontrolle und Arbeitsgedächtnis, verbessert sich laut einer Übersicht über 12 bis 24 Wochen.',
    'Impulskontrolle ist ein Muskel, der Zeit braucht.',
    'Quelle: Archangel Centers, Cocaine Withdrawal Timeline (Behandlungszentrum)',
    'Übe heute eine Pause vor einer Entscheidung und zähle bis zehn.',
  ),
  GittyDay(
    'Bei Menschen, die 10 bis 25 Monate abstinent waren, war die Aktivität im Stirnhirn bei der Impulskontrolle höher als bei Menschen, die ein bis fünf Wochen abstinent waren.',
    'Je länger du durchhältst, desto stärker wird die Bremse im Kopf.',
    'Quelle: Recovering from Cocaine: Clinical and Preclinical Insights (PMC, 2013)',
    'Schreibe eine Sache auf, die du in einem Jahr anders haben willst.',
  ),
  GittyDay(
    'Studien an Menschen, die Kokain, Heroin oder Ketamin abgesetzt haben, fanden Zeichen der Hirnerholung in Regionen für Selbstkontrolle und Entscheidungen.',
    'Zwei Wochen sind geschafft. Das Gehirn arbeitet bereits an der Reparatur.',
    'Quelle: Australian Drug Foundation, Alcohol, other drugs and the brain',
    'Gestehe dir heute zu, dass zwei Wochen echte Arbeit waren, und belohne dich.',
  ),
];

const _alcohol2 = <GittyDay>[
  GittyDay(
    'Leberfett kann sich laut Zusammenfassung nach zwei bis drei Wochen ohne Alkohol vollständig zurückbilden.',
    'Das gilt für frühe Fettleber. Vernarbtes Gewebe bildet sich nicht in Wochen zurück.',
    'Quelle: ScienceInsights, What giving up alcohol actually does to the body',
    'Wenn du lange viel getrunken hast, vereinbare einen Arzttermin zur Kontrolle der Leberwerte.',
  ),
  GittyDay(
    'In einer Studie sank nach einem Monat Abstinenz der systolische Blutdruck im Schnitt um 6,6 Prozent und das Körpergewicht um 1,5 Prozent.',
    'Du bist auf dem Weg dorthin. Nach einem Monat zeigen sich die Effekte deutlich.',
    'Quelle: Short-term abstinence from alcohol and changes in cardiovascular risk factors (BMJ Open, 2018)',
    'Ersetze heute ein Getränk durch Wasser und achte darauf, wie du dich fühlst.',
  ),
  GittyDay(
    'Die Insulinresistenz sank nach einem Monat Abstinenz im Schnitt um etwa 26 Prozent.',
    'Das schützt langfristig vor Typ-2-Diabetes und Fettleber.',
    'Quelle: Short-term abstinence from alcohol (BMJ Open, 2018)',
    'Iss heute eine ausgewogene Mahlzeit mit Eiweiß und Gemüse.',
  ),
  GittyDay(
    'Leberwerte kehren etwa einen Monat nach dem Stopp auf das Ausgangsniveau zurück.',
    'Das sind die Werte, die Ärzte nutzen, um Leberschäden zu erkennen.',
    'Quelle: ScienceInsights, What giving up alcohol actually does to the body',
    'Merke dir einen Kontrolltermin in etwa zwei Wochen vor.',
  ),
  GittyDay(
    'Nach vier bis fünf Monaten ohne Alkohol sind die meisten motorischen und kognitiven Funktionen wieder auf dem Niveau vor dem Trinken.',
    'Konzentration, Arbeitsgedächtnis und Koordination verbessern sich stetig.',
    'Quelle: ScienceInsights, What giving up alcohol actually does to the body',
    'Löse heute ein Rätsel oder spiele ein Denkspiel.',
  ),
  GittyDay(
    'Die Gehirnmasse nimmt in den ersten Monaten ohne Alkohol wieder zu.',
    'Dein Kopf baut zurück, was Alkohol abgebaut hat.',
    'Quelle: ScienceInsights, What giving up alcohol actually does to the body',
    'Schreibe auf, woran du dich heute besser erinnerst als vor zwei Wochen.',
  ),
  GittyDay(
    'Krebsbezogene Wachstumsfaktoren sanken nach einem Monat Abstinenz deutlich: VEGF um etwa 42 Prozent, EGF um etwa 74 Prozent.',
    'Das ist keine Garantie, aber ein Hinweis, wie stark Alkohol den Körper belastet.',
    'Quelle: Short-term abstinence from alcohol (BMJ Open, 2018)',
    'Zwei Wochen sind geschafft. Belohne dich mit etwas, das nichts mit Alkohol zu tun hat.',
  ),
];

const _social2 = <GittyDay>[
  GittyDay(
    'In einer Studie mit knapp 500 Personen verbesserten zwei Wochen ohne mobiles Internet Aufmerksamkeit und Wohlbefinden. Der Aufmerksamkeitsgewinn entsprach dem Umkehren von etwa zehn Jahren altersbedingtem Abbau.',
    'Telefonieren und SMS waren weiter erlaubt. Es ging um Social Media und mobiles Internet.',
    'Quelle: Georgetown University, Digital Detoxes Work (zu einer Studie in PNAS Nexus)',
    'Lege dein Handy heute eine Stunde in ein anderes Zimmer.',
  ),
  GittyDay(
    'Die Teilnehmenden schliefen während der Detox-Phase im Schnitt 20 Minuten mehr pro Nacht.',
    'Weniger Bildschirm, mehr Schlaf, das summiert sich.',
    'Quelle: Georgetown University, Digital Detoxes Work',
    'Lege das Handy heute nicht ins Schlafzimmer.',
  ),
  GittyDay(
    'In einer Studie mit 31 jungen Erwachsenen verbesserten zwei Wochen mit höchstens 30 Minuten Social Media pro Tag Schlaf, Lebenszufriedenheit, Stress und Beziehungen.',
    'Auch die Smartphone- und Social-Media-Abhängigkeit sank. Die Studie war klein und explorativ.',
    'Quelle: The Effects of a Two-Week Social Media Digital Detox (PMC, 2023)',
    'Stelle dir heute ein Tageslimit von 30 Minuten ein.',
  ),
  GittyDay(
    'In einem Zwei-Wochen-Versuch sank die Handyzeit von durchschnittlich 314 auf 161 Minuten pro Tag.',
    'Weniger als die Hälfte der Zeit, und die Teilnehmenden meldeten bessere Aufmerksamkeit und mehr Wohlbefinden.',
    'Quelle: PNAS Nexus, zitiert nach Blue Cross Blue Shield of Michigan',
    'Prüfe deine Bildschirmzeit der letzten drei Tage.',
  ),
  GittyDay(
    'Eine Woche Social-Media-Pause senkte Angstsymptome um 16,1 Prozent.',
    'Die Nutzung in der Studie sank deutlich. Es gibt auch Nuancen: Nicht jeder profitiert gleich.',
    'Quelle: JAMA Network Open (2025), zitiert nach Harvard Gazette',
    'Beobachte heute, welche App dich nach der Nutzung schlechter fühlen lässt.',
  ),
  GittyDay(
    'Eine Übersichtsarbeit zu Digital Detox fand, dass die Wirkungen je nach Studie unterschiedlich ausfielen. Mehrere zeigten weniger Depressionssymptome.',
    'Es gibt keine Wundermethode. Deine eigene Beobachtung ist wichtig.',
    'Quelle: Digital detox: An effective solution in the smartphone era? (Übersichtsarbeit, 2022)',
    'Schreibe ehrlich auf, was sich bei dir verändert hat.',
  ),
  GittyDay(
    'Zwei Wochen sind geschafft. Die Studien zeigen Verbesserungen bei Wohlbefinden und Aufmerksamkeit, aber nicht, wie lange sie anhalten.',
    'Dauerhaft wirkt es nur mit neuen Gewohnheiten, nicht mit Willenskraft allein.',
    'Quelle: Georgetown University und Harvard Gazette',
    'Wähle eine Handygewohnheit, die bleibt, zum Beispiel das Handy nachts außerhalb des Schlafzimmers zu lassen.',
  ),
];

const _porn2 = <GittyDay>[
  GittyDay(
    'In einem Experiment schätzten Teilnehmende, die Pornografie konsumieren sollten, die Chance auf eine Zukunft mit ihrem Partner auf 30 Prozent, die Abstinenz-Gruppe auf 63 Prozent.',
    'Die Studie war klein und beruhte auf Selbstauskunft. Sie zeigt eine Tendenz, keinen Beweis.',
    'Quelle: Lambert et al., Pornography consumption and weakened commitment to one’s romantic partner (2012)',
    'Überlege, was dir in Beziehungen wichtig ist, und schreibe es auf.',
  ),
  GittyDay(
    'Wer drei Wochen auf Pornografie verzichtete, zeigte laut einer Studie weniger Neigung zu schneller Belohnung als eine Gruppe, die auf ihr Lieblingsessen verzichtete.',
    'Dabei geht es um Geduld: lieber später mehr als sofort weniger.',
    'Quelle: Negash et al. (2015), zitiert in einer Masterarbeit der Universität Turku',
    'Entscheide dich heute einmal bewusst für die größere Belohnung später.',
  ),
  GittyDay(
    'Eine qualitative Studie zu Rebooting-Gemeinschaften beschreibt die Erfahrungen der Mitglieder, belegt aber keine Wirkung.',
    'Erfahrungsberichte sind kein Beweis. Sie können dir aber zeigen, dass andere ebenfalls kämpfen.',
    'Quelle: The Pornography Rebooting Experience (PMC, 2021)',
    'Notiere, was dir bei Anderen aufgefallen ist und was du nicht teilst.',
  ),
  GittyDay(
    'Für die Diagnose zwanghaftes Sexualverhalten muss das Muster laut Fachliteratur sechs Monate oder länger bestehen und deutlichen Leidensdruck verursachen.',
    'Nicht jeder, der Pornografie nutzt, hat eine Störung. Wenn du Kontrolle verlierst, ist Hilfe sinnvoll.',
    'Quelle: Making sense of ICD-11 diagnostic criteria of compulsive sexual behavioural disorder (Annals Singapore, 2025)',
    'Wenn das auf dich zutrifft, such dir eine Beratungsstelle in deiner Nähe.',
  ),
  GittyDay(
    'Bis 2023 gab es nur drei Experimente zu Pornografie-Abstinenz.',
    'Vieles, was im Netz behauptet wird, ist nicht belegt. Das gilt in beide Richtungen.',
    'Quelle: Effects of a 7-Day Pornography Abstinence Period, Archives of Sexual Behavior (2023)',
    'Führe ein kurzes Tagebuch zu Stimmung und Drang, jeden Abend ein Satz.',
  ),
  GittyDay(
    'Die Studienlage ist dünn: Die meisten Experimente dauerten sieben Tage bis drei Wochen.',
    'Was nach vier Wochen oder einem Jahr passiert, ist kaum untersucht. Deine eigene Beobachtung zählt mehr als jede Behauptung im Netz.',
    'Quelle: Effects of a 7-Day Pornography Abstinence Period (2023); Negash et al. (2015)',
    'Schreibe drei Veränderungen auf, die du bei dir bemerkst, ohne sie zu bewerten.',
  ),
  GittyDay(
    'In der Siebentagesstudie sank die Nutzung der Abstinenzgruppe deutlich, aber nicht auf null.',
    'Ausrutscher sind kein Beweis, dass es nicht klappt. Sie sind Lernmaterial.',
    'Quelle: Effects of a 7-Day Pornography Abstinence Period, Archives of Sexual Behavior (2023)',
    'Zwei Wochen sind geschafft. Belohne dich mit etwas, das dir guttut.',
  ),
];
