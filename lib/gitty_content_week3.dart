import 'package:quitter/gitty_content.dart';

GittyDay? gittyWeek3For(String habitKey, int dayNumber) {
  final track = switch (habitKey) {
    'marijuana' => _cannabis3,
    'smoking' || 'nicotine_pouches' || 'smokeless_tobacco' => _nicotine3,
    'vaping' => _vaping3,
    'cocaine' => _cocaine3,
    'alcohol' => _alcohol3,
    'social_media' => _social3,
    'pornography' => _porn3,
    _ => null,
  };
  final i = dayNumber - 15;
  if (track == null || i < 0 || i >= track.length) return null;
  return track[i];
}

const _cannabis3 = <GittyDay>[
  GittyDay(
    'Veränderungen der Schlafstruktur halten laut Studienlage mindestens zwei Wochen an, Schlafprobleme und seltsame Träume wurden bis zu sieben Wochen nach dem Stopp beobachtet.',
    'Wenn dein Schlaf noch holprig ist, bist du nicht allein und nicht im Rückstand.',
    'Quelle: Sleep disturbance in cannabis withdrawal (PMC, 2011)',
    'Gehe heute zur gleichen Uhrzeit ins Bett wie gestern.',
  ),
  GittyDay(
    'Die Veränderungen im REM-Schlaf klingen in Woche 2 bis 4 meist ab, Wachphasen und weniger Tiefschlaf können aber anhalten.',
    'Das kann sich nach unerholsamem Schlaf und Müdigkeit anfühlen, obwohl es besser wird.',
    'Quelle: Mosaic Behavioral Health Center, Insomnia After Quitting Marijuana (Behandlungszentrum, Blog)',
    'Verzichte heute nach 14 Uhr auf Koffein.',
  ),
  GittyDay(
    'Intensive Träume sind eine normale Folge des REM-Rebounds: Das Gehirn holt den unterdrückten REM-Schlaf nach.',
    'In der Studie stieg der REM-Anteil beim Abbruch des Konsums an.',
    'Quelle: Sleep disturbance in cannabis withdrawal (PMC, 2011)',
    'Schreibe heute einen Traum auf, an den du dich erinnerst.',
  ),
  GittyDay(
    'Laut einer Zusammenfassung von PET-Studien verschwanden Unterschiede in der CB1-Rezeptorverfügbarkeit zwischen Konsumierenden und Kontrollen nach zwei Tagen Abstinenz und blieben auch nach 28 Tagen aus.',
    'Dein Gehirn stellt sich um, und das messbar.',
    'Quelle: Mosaic Behavioral Health Center, Insomnia After Quitting Marijuana (Behandlungszentrum, Blog)',
    'Gehe heute morgens mindestens 20 Minuten ins Tageslicht.',
  ),
  GittyDay(
    'Viele merken nach zwei bis drei Wochen eine deutliche Besserung des Schlafs, bei langem Konsum oder viel THC kann es länger dauern.',
    'Dass es dauert, heißt nicht, dass es nicht klappt.',
    'Quelle: Midwest Recovery Centers, Weed withdrawal insomnia (Behandlungszentrum)',
    'Bewerte dein Befinden heute morgens von 0 bis 10 und notiere es.',
  ),
  GittyDay(
    'In einer ambulanten Studie wurden Schlafprobleme und seltsame Träume bis zu sieben Wochen nach dem Stopp beobachtet.',
    'Das ist die obere Grenze, nicht der Normalfall. Die meisten erholen sich schneller.',
    'Quelle: Sleep disturbance in cannabis withdrawal (PMC, 2011), mit Bezug auf Budney et al. (2003)',
    'Lege heute eine Stunde vor dem Schlafen das Handy weg.',
  ),
  GittyDay(
    'Drei Wochen: Bei schwer Konsumierenden können Entzugssymptome laut Fachartikel drei Wochen und länger andauern, bei vielen sind sie dann mild oder vorbei.',
    'Du hast die Zeitspanne erreicht, nach der es für viele spürbar leichter wird.',
    'Quelle: Clinical management of cannabis withdrawal (Fachartikel, PMC 2022)',
    'Gönne dir etwas Schönes von dem Geld, das du gespart hast.',
  ),
];

const _nicotine3 = <GittyDay>[
  GittyDay(
    'Schlafprobleme nach dem Rauchstopp hören laut HSE meist nach zwei bis drei Wochen auf.',
    'Wenn du wieder besser schläfst, fällt alles andere leichter.',
    'Quelle: HSE, Cravings and withdrawal when you stop smoking',
    'Gehe heute zur gleichen Zeit ins Bett und stehe zur gleichen Zeit auf.',
  ),
  GittyDay(
    'Entzugssymptome halten im Schnitt drei bis vier Wochen an, bei manchen länger, manchmal sogar mehrere Monate.',
    'Wenn es sich nach Woche drei noch zäh anfühlt, ist das nichts Außergewöhnliches.',
    'Quelle: NHS, Managing nicotine withdrawal symptoms',
    'Lies heute deine Liste mit Gründen noch einmal durch.',
  ),
  GittyDay(
    'Eine Review fand, dass Aufhörende Entzugssymptome typischerweise nur zwei bis vier Wochen nach dem Stopptag erleben.',
    'Du hast den größten Teil schon hinter dir.',
    'Quelle: Life One Year After a Quit Attempt (PMC, 2012), mit Bezug auf eine Review',
    'Sag einer Person, dass du jetzt zweieinhalb Wochen durch bist.',
  ),
  GittyDay(
    'Das Verlangen bessert sich laut HSE meist vier bis sechs Wochen nach dem Rauchstopp deutlich.',
    'Bis dahin helfen feste Gegenstrategien für deine Risikomomente.',
    'Quelle: HSE, Cravings and withdrawal when you stop smoking',
    'Plane für Alkohol, Pausen und Stress je eine Gegenstrategie.',
  ),
  GittyDay(
    'Ein Monat nach dem Stopp kann Verlangen noch auftreten, ist aber meist seltener und schwächer.',
    'Ein Ausrutscher des Gedankens ist kein Ausrutscher der Tat.',
    'Quelle: EX Program, Nicotine Withdrawal Timeline',
    'Notiere, wie oft heute Verlangen kam und wie lange es dauerte.',
  ),
  GittyDay(
    'Nach einem Jahr berichteten nur Aufhörende deutlich weniger Verlangen, weniger Unruhe und weniger stressige Ereignisse als Menschen, die weiter rauchten.',
    'Die Belohnung für das Durchhalten wächst mit der Zeit.',
    'Quelle: Life One Year After a Quit Attempt (PMC, 2012)',
    'Notiere eine Sache, die heute leichter ist als vor drei Wochen.',
  ),
  GittyDay(
    'Drei Wochen: Du bist mitten im Zeitraum von drei bis vier Wochen, in dem Entzugssymptome im Schnitt abklingen.',
    'Die härteste Phase liegt hinter dir.',
    'Quelle: EX Program, Nicotine Withdrawal Timeline; NHS',
    'Belohne dich heute mit etwas, das nichts mit Nikotin zu tun hat.',
  ),
];

const _vaping3 = <GittyDay>[
  GittyDay(
    'Entzugssymptome beim Nikotinstopp halten im Schnitt drei bis vier Wochen an.',
    'Die Angabe gilt allgemein für Nikotin und nicht nur für Vapes.',
    'Quelle: EX Program, Nicotine Withdrawal Timeline',
    'Lies heute deine Liste mit Gründen noch einmal durch.',
  ),
  GittyDay(
    'Eine Review fand, dass Entzugssymptome typischerweise zwei bis vier Wochen nach dem Stopptag anhalten.',
    'Du bist in diesem Zeitfenster. Es geht nur noch ums Aushalten der letzten Wellen.',
    'Quelle: Life One Year After a Quit Attempt (PMC, 2012), mit Bezug auf eine Review',
    'Notiere, wann dein Verlangen heute am stärksten war.',
  ),
  GittyDay(
    'Ein Monat nach dem Stopp kann Verlangen noch auftreten, ist aber meist seltener und schwächer.',
    'Verlangen verschwindet nicht schlagartig, es wird leiser.',
    'Quelle: EX Program, Nicotine Withdrawal Timeline',
    'Plane für Pausen und Abende eine feste Alternative zum Vape.',
  ),
  GittyDay(
    'Beim Rauchstopp bessert sich das Verlangen laut HSE meist vier bis sechs Wochen nach dem Stopp deutlich.',
    'Die Zahl stammt vom Rauchen. Für Vapes ist die Datenlage dünner, der Verlauf ähnelt sich aber.',
    'Quelle: HSE, Cravings and withdrawal when you stop smoking',
    'Tausche heute den Moment, in dem du gedampft hättest, gegen zehn Minuten Bewegung.',
  ),
  GittyDay(
    'Nach einem Jahr berichteten nur Aufhörende deutlich weniger Verlangen und weniger Unruhe.',
    'Die Studie betraf Rauchende. Das Prinzip dahinter gilt auch für Nikotin im Allgemeinen.',
    'Quelle: Life One Year After a Quit Attempt (PMC, 2012)',
    'Schreibe auf, wie du dich in einem Jahr fühlen willst.',
  ),
  GittyDay(
    'Bei manchen halten Entzugssymptome länger, manchmal sogar mehrere Monate.',
    'Das ist die Ausnahme. Wenn es dich trifft, such dir Unterstützung.',
    'Quelle: NHS, Managing nicotine withdrawal symptoms',
    'Falls du nach einem Monat noch stark kämpfst, sprich mit einer Ärztin oder einem Arzt.',
  ),
  GittyDay(
    'Drei Wochen: Du bist im Zeitraum, in dem Entzugssymptome im Schnitt abklingen.',
    'Das Schwerste liegt hinter dir.',
    'Quelle: EX Program, Nicotine Withdrawal Timeline',
    'Belohne dich heute mit etwas, das nichts mit Nikotin zu tun hat.',
  ),
];

const _cocaine3 = <GittyDay>[
  GittyDay(
    'Das Verlangen ohne äußere Auslöser sinkt in klinischen Studien während des ersten Monats Abstinenz stetig.',
    'Dein Grundverlangen wird also leiser.',
    'Quelle: Translational Research on Incubation of Cocaine Craving (PMC, 2016)',
    'Notiere heute, wann Verlangen kam und wie lange es dauerte.',
  ),
  GittyDay(
    'Das Verlangen auf Reize wie Orte, Personen oder Bilder kann laut Forschung dagegen über Wochen ansteigen.',
    'Das heißt Inkubation. Es ist kein Zeichen, dass du versagst.',
    'Quelle: Translational Research on Incubation of Cocaine Craving (PMC, 2016)',
    'Meide heute bewusst einen Auslöser, den du kennst.',
  ),
  GittyDay(
    'In einer Studie mit 76 langjährigen Kokainnutzern war die Hirnreaktion auf Kokain-Reize nach einem und nach sechs Monaten Abstinenz höher als nach zwei Tagen oder einem Jahr.',
    'Der Verlauf ist kein gerader Weg. Eine Phase mit stärkerer Reaktion kann kommen.',
    'Quelle: Translational Research on Incubation of Cocaine Craving (PMC, 2016)',
    'Vereinbare einen Termin bei einer Beratungsstelle für die kommenden Wochen.',
  ),
  GittyDay(
    'In derselben Studie sanken die selbstberichteten Werte für Wollen und Mögen von Kokain über die Abstinenz hinweg.',
    'Dein Kopf will weniger, auch wenn das Gehirn auf Reize noch reagiert.',
    'Quelle: Translational Research on Incubation of Cocaine Craving (PMC, 2016)',
    'Schreibe auf, was du heute nicht mehr willst.',
  ),
  GittyDay(
    'Hohe Impulsivität und starke Reaktion auf Reize erhöhen das Rückfallrisiko. Sinken beide, schützt das.',
    'Genau daran arbeitest du jeden Tag.',
    'Quelle: Neural correlates of craving and impulsivity in abstinent cocaine users (PMC, 2014)',
    'Atme heute fünf Minuten ruhig, bevor du eine wichtige Entscheidung triffst.',
  ),
  GittyDay(
    'Zwanghaftes Verlangen war in einer Studie umso geringer, je länger die Abstinenz dauerte.',
    'Jeder Tag, den du durchhältst, wirkt gegen das Verlangen.',
    'Quelle: Neural correlates of craving and impulsivity in abstinent cocaine users (PMC, 2014)',
    'Zähle heute, wie viele Tage du schon geschafft hast, und sag die Zahl laut.',
  ),
  GittyDay(
    'Drei Wochen: Das Rückfallrisiko bleibt über Wochen und Monate ein Thema, daher ist Begleitung auch nach dem Entzug sinnvoll.',
    'Forschende leiten daraus ab, dass Nachsorge länger laufen sollte.',
    'Quelle: Translational Research on Incubation of Cocaine Craving (PMC, 2016)',
    'Lege einen festen Termin für Beratung oder Selbsthilfe fest.',
  ),
];

const _alcohol3 = <GittyDay>[
  GittyDay(
    'Nach einigen Wochen fühlen sich die meisten besser, selbst sehr schwere Trinker berichten nach ein bis zwei Monaten über besseren Mood.',
    'Dein Schlaf und deine Stimmung bauen sich gegenseitig auf.',
    'Quelle: The Conversation, Even a day off alcohol makes a difference',
    'Schreibe auf, wie deine Stimmung heute ist, auf einer Skala von 0 bis 10.',
  ),
  GittyDay(
    'Der Schlaf wird in den ersten vier Wochen schrittweise besser, danach schläfst du tiefer und wachst erholter auf.',
    'Wenn es nicht linear besser wird, ist das normal.',
    'Quelle: AARP, 8 Health Benefits of Quitting Alcohol for a Month',
    'Steh morgens zur gleichen Uhrzeit auf.',
  ),
  GittyDay(
    'Nach einem Monat ohne Alkohol sanken in einer Studie das Leberfett um 15 Prozent und der Blutzucker um 23 Prozent. Das Gewicht ging um 1,5 Kilogramm zurück, Schlafqualität und Konzentration stiegen um 10 und 18 Prozent.',
    'Das sind Durchschnittswerte aus einer einzelnen Studie mit Dry-January-Teilnehmenden.',
    'Quelle: A scoping review of Dry January (PMC, 2025), zu Coghlan et al. (2014)',
    'Achte heute bei einer Aufgabe auf deine Konzentration und notiere sie.',
  ),
  GittyDay(
    'Ein Review von 16 Dry-January-Studien fand bessere Schlafqualität, bessere Stimmung, Gewichtsverlust sowie bessere Leberfunktion und besseren Blutdruck. Eine kleine Gruppe, die den Monat nicht schaffte, trank danach mehr.',
    'Wichtig ist, nicht nach einem Ausrutscher alles hinzuwerfen.',
    'Quelle: Brown University School of Public Health, Review in Alcohol and Alcoholism (2025)',
    'Wenn du ausrutschst: einen Tag nach dem anderen, nicht alles hinwerfen.',
  ),
  GittyDay(
    'In Umfragen unter über 1.000 Menschen mit einem Monat ohne Alkohol schliefen 71 Prozent besser, 67 hatten mehr Energie, 58 verloren Gewicht und 54 hatten bessere Haut.',
    'Selbstauskunft, keine Messung, aber ein Muster.',
    'Quelle: AARP, 8 Health Benefits of Quitting Alcohol for a Month',
    'Schau dich im Spiegel an und notiere eine Veränderung.',
  ),
  GittyDay(
    'Etwa um die zwei Wochen herum merkst du laut Alcohol Change UK besser, wie viel Wasser dein Körper braucht, und bist besser hydriert. Gesichtsrötung und Poren können abnehmen.',
    'Alkohol entwässert, deshalb macht Verzicht die Haut sichtbar frischer.',
    'Quelle: Alcohol Change UK, Benefits of Dry January',
    'Trinke heute zwei Liter Wasser, verteilt über den Tag.',
  ),
  GittyDay(
    'Drei Wochen: Menschen, die einen Monat Pause machen, trinken laut Studien danach langfristig tendenziell weniger.',
    'Du bist auf dem Weg, aus einer Pause eine Gewohnheit zu machen.',
    'Quelle: AARP, 8 Health Benefits of Quitting Alcohol for a Month',
    'Plane die letzte Woche deines ersten Monats mit mindestens einem Fixpunkt pro Tag.',
  ),
];

const _social3 = <GittyDay>[
  GittyDay(
    'In einer Studie mit 143 Studierenden senkte die Begrenzung von Facebook, Instagram und Snapchat auf zehn Minuten pro Plattform und Tag über drei Wochen Einsamkeit und Depression.',
    'Die Kontrollgruppe nutzte wie gewohnt. Der Unterschied war signifikant.',
    'Quelle: Hunt et al., No More FOMO, Journal of Social and Clinical Psychology (2018)',
    'Begrenze heute jede Plattform auf zehn Minuten.',
  ),
  GittyDay(
    'In beiden Gruppen sanken Angst und die Angst, etwas zu verpassen (FOMO), gegenüber dem Ausgangswert. Die Autoren deuten das als Wirkung der Selbstbeobachtung.',
    'Schon genau hinzusehen, verändert das Verhalten.',
    'Quelle: Hunt et al., No More FOMO (2018)',
    'Führe heute ein Nutzungstagebuch: App, Uhrzeit, Anlass.',
  ),
  GittyDay(
    'Die Autoren schließen, dass eine Begrenzung auf etwa 30 Minuten pro Tag das Wohlbefinden deutlich verbessern kann.',
    'Es geht nicht um Verzicht, sondern um ein Maß, das du halten kannst.',
    'Quelle: Hunt et al., No More FOMO (2018)',
    'Stelle dir einen Timer von 30 Minuten für alle Social-Media-Apps zusammen.',
  ),
  GittyDay(
    'Nach drei Wochen waren Einsamkeit und Depression in der Begrenzungsgruppe signifikant geringer als in der Kontrollgruppe.',
    'Weniger vergleichen, mehr echter Kontakt.',
    'Quelle: Hunt et al., No More FOMO (2018); Associations between social media use and loneliness (PMC, 2023)',
    'Schreibe heute einer Person persönlich statt über eine Plattform.',
  ),
  GittyDay(
    'Eine Übersichtsarbeit fand in allen drei einbezogenen Studien weniger Depressionssymptome nach einer Pause von Social Media oder Smartphone.',
    'Die Zahl der Studien ist klein, das Ergebnis aber einheitlich.',
    'Quelle: Digital detox: An effective solution in the smartphone era? (Übersichtsarbeit, 2022)',
    'Plane einen handyfreien Abend.',
  ),
  GittyDay(
    'Dauerhafte Veränderung gelingt in den Studien eher mit klaren Limits als mit totalem Verzicht.',
    'Ein Limit ist leichter zu halten als ein Verbot.',
    'Quelle: Hunt et al., No More FOMO (2018)',
    'Wähle ein Limit, das du in den nächsten Wochen halten kannst.',
  ),
  GittyDay(
    'Drei Wochen: Du hast die Dauer der Studie von Hunt et al. erreicht.',
    'In der Studie haben die Teilnehmenden danach messbar weniger Einsamkeit und Depression berichtet.',
    'Quelle: Hunt et al., No More FOMO (2018)',
    'Lege fest, was von deinen neuen Regeln bleibt.',
  ),
];

const _porn3 = <GittyDay>[
  GittyDay(
    'Die Rebooting-Idee ist beliebt, aber die Studienlage zu ihrer Wirkung ist dünn.',
    'Erfahrungen aus Foren sind kein Beweis, und manche Behauptungen im Netz sind stark übertrieben.',
    'Quelle: The Pornography Rebooting Experience (PMC, 2021)',
    'Frage dich, was du dir von Abstinenz wirklich erhoffst, und schreibe es auf.',
  ),
  GittyDay(
    'Zwanghaftes Sexualverhalten beschreibt die ICD-11 als anhaltendes Scheitern, intensive, wiederkehrende sexuelle Impulse zu kontrollieren.',
    'Es geht um Kontrollverlust, nicht um moralische Bewertung.',
    'Quelle: Compulsive sexual behaviour disorder in the ICD-11 (World Psychiatry, PMC 2018)',
    'Frage dich ehrlich, ob du Kontrolle hast, und schreibe die Antwort auf.',
  ),
  GittyDay(
    'Es gibt keine belastbaren Langzeitstudien, die zeigen, nach wie vielen Wochen sich bestimmte Effekte der Abstinenz einstellen.',
    'Bis 2023 gab es nur drei Experimente, die längsten dauerten wenige Wochen.',
    'Quelle: Effects of a 7-Day Pornography Abstinence Period (Archives of Sexual Behavior, 2023)',
    'Beobachte dich selbst: Stimmung, Fokus, Schlaf, jeweils von 0 bis 10.',
  ),
  GittyDay(
    'In einer Arbeit zu Pornografie und Partnerschaft hing häufigerer Konsum mit geringerer Bindung an den Partner zusammen.',
    'Zusammenhang heißt nicht automatisch Ursache.',
    'Quelle: Lambert et al., Pornography consumption and weakened commitment (2012)',
    'Überlege, was dir an Nähe und Beziehung wichtig ist.',
  ),
  GittyDay(
    'Die Studie von Negash et al. ließ Teilnehmende drei Wochen auf Pornografie verzichten.',
    'Du bist gerade etwa so lang dabei wie sie.',
    'Quelle: Negash et al. (2015), zitiert in einer Masterarbeit der Universität Turku',
    'Notiere, was dir die letzten drei Wochen gezeigt haben.',
  ),
  GittyDay(
    'Selbstberichtete Besserungen sind in Online-Gruppen üblich, aber nicht kontrolliert untersucht.',
    'Das heißt nicht, dass sie falsch sind, sondern dass sie nicht bewiesen sind.',
    'Quelle: The Pornography Rebooting Experience (PMC, 2021)',
    'Schreibe drei Veränderungen auf, die du selbst bemerkst.',
  ),
  GittyDay(
    'Drei Wochen: Das entspricht der Länge der längsten bekannten Abstinenz-Experimente.',
    'Alles darüber hinaus ist Neuland. Sei neugierig und ehrlich zu dir.',
    'Quelle: Negash et al. (2015); Effects of a 7-Day Pornography Abstinence Period (2023)',
    'Belohne dich heute mit etwas, das dir guttut.',
  ),
];
