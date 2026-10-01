import 'package:quitter/gitty_content.dart';

GittyDay? gittyWeek4For(String habitKey, int dayNumber) {
  final track = switch (habitKey) {
    'marijuana' => _cannabis4,
    'smoking' || 'nicotine_pouches' || 'smokeless_tobacco' => _nicotine4,
    'vaping' => _vaping4,
    'cocaine' => _cocaine4,
    'alcohol' => _alcohol4,
    'social_media' => _social4,
    'pornography' => _porn4,
    _ => null,
  };
  final i = dayNumber - 22;
  if (track == null || i < 0 || i >= track.length) return null;
  return track[i];
}

const _cannabis4 = <GittyDay>[
  GittyDay(
    'In einer kontrollierten Studie mit 179 Jugendlichen, die mindestens wöchentlich konsumierten, stiegen Angst und Depression in vier Wochen Abstinenz nicht an.',
    'Die Sorge, dass Verzicht die Stimmung verschlechtert, bestätigte sich in der Studie nicht.',
    'Quelle: Assessing Changes in Symptoms of Depression and Anxiety During Cannabis Abstinence (PMC, 2021)',
    'Schreibe auf, welche Sorge vor dem Verzicht sich bei dir nicht bestätigt hat.',
  ),
  GittyDay(
    'Bei Teilnehmenden, die Cannabis zum Umgang mit negativen Gefühlen nutzten, zeigte sich ein Trend zu stärkerer Besserung von Angst und Depression.',
    'Der Trend war nicht statistisch gesichert, er deutet aber in eine hoffnungsvolle Richtung.',
    'Quelle: Assessing Changes in Symptoms of Depression and Anxiety During Cannabis Abstinence (PMC, 2021)',
    'Notiere, in welchen Situationen du früher zum Konsum gegriffen hast, um dich zu beruhigen.',
  ),
  GittyDay(
    'Das Cannabis-Entzugssyndrom dauert meist bis zu drei Wochen. Seine durchschnittliche Schwere ist mit einer mittleren Depression oder einem Alkoholentzug vergleichbar.',
    'Wenn du die letzten Wochen als hart erlebt hast, war das nicht eingebildet.',
    'Quelle: The cannabis withdrawal syndrome: current insights (Dove Press, Übersichtsarbeit)',
    'Würdige heute, dass du etwas Hartes durchgestanden hast.',
  ),
  GittyDay(
    'In einer Studie waren die Symptome in den ersten zehn Tagen am stärksten, Reizbarkeit und körperliche Anspannung hielten aber die ganzen 28 Tage an.',
    'Falls du dich noch angespannt fühlst, passt das zum Verlauf in dieser Studie.',
    'Quelle: The cannabis withdrawal syndrome: current insights (Dove Press, Übersichtsarbeit)',
    'Mach heute eine Entspannungsübung von zehn Minuten: dehnen oder ruhig atmen.',
  ),
  GittyDay(
    'Bei Cannabisabhängigen hing die CB1-Rezeptor-Verfügbarkeit stark mit den Entzugssymptomen nach zwei Tagen zusammen. Die Symptome lösten sich in den folgenden 28 Tagen auf.',
    'Die Beschwerden haben also eine messbare Grundlage im Gehirn.',
    'Quelle: The cannabis withdrawal syndrome: current insights (Dove Press, Übersichtsarbeit)',
    'Beobachte heute, wie sich dein Befinden im Vergleich zu Woche eins unterscheidet.',
  ),
  GittyDay(
    'Kurzfristig fühlt sich Cannabis bei Angst oft erleichternd an, einen dauerhaften Nutzen gibt es laut einer Auswertung von 2025 nicht.',
    'Das Gefühl der Beruhigung ist real, hält aber nicht an.',
    'Quelle: Psychiatry and Psychotherapy Podcast, Cannabis Update 2025 (Zusammenfassung von Studien, Podcast)',
    'Suche dir eine Beruhigungsstrategie, die ohne Substanz funktioniert.',
  ),
  GittyDay(
    'Vier Wochen entsprechen dem Zeitraum, den die meisten kontrollierten Abstinenzstudien untersuchen.',
    'Du hast jetzt selbst durchlebt, was dort gemessen wurde.',
    'Quelle: Assessing Changes in Symptoms of Depression and Anxiety During Cannabis Abstinence (PMC, 2021)',
    'Sag einer Person, dass du fast einen Monat geschafft hast.',
  ),
  GittyDay(
    'In derselben Studie sanken Angst- und Depressionssymptome über die Zeit bei allen Teilnehmenden, mit und ohne Abstinenz.',
    'Stimmung schwankt auch von allein. Du musst nicht jede Besserung allein dem Verzicht zuschreiben.',
    'Quelle: Assessing Changes in Symptoms of Depression and Anxiety During Cannabis Abstinence (PMC, 2021)',
    'Beobachte ehrlich, was sich verändert hat und was Zufall sein könnte.',
  ),
  GittyDay(
    'Ein Monat: Die akute Entzugsphase liegt hinter dir, die Erholung von Schlaf, Gedächtnis und Aufmerksamkeit läuft weiter.',
    'Das ist ein echter Meilenstein.',
    'Quelle: Clinical management of cannabis withdrawal (PMC, 2022); Cannabis cessation and neurocognitive recovery (2026)',
    'Belohne dich heute mit etwas Besonderem von dem Geld, das du gespart hast.',
  ),
];

const _nicotine4 = <GittyDay>[
  GittyDay(
    'Etwa 80 Prozent der Raucher, die ohne Hilfe aufhören, werden innerhalb des ersten Monats rückfällig, nur 3 bis 5 Prozent bleiben nach sechs Monaten abstinent.',
    'Das ist keine Drohung, sondern der Grund, warum dieser Monat so wichtig ist. Du bist dabei.',
    'Quelle: Handling relapse in smoking cessation (Internal and Emergency Medicine, 2012)',
    'Notiere deine drei stärksten Risikosituationen und deinen Plan für jede.',
  ),
  GittyDay(
    'Rückfälle passieren am häufigsten in den ersten Wochen nach dem Stopp.',
    'Wer die ersten Wochen schafft, hat die gefährlichste Phase im Wesentlichen hinter sich.',
    'Quelle: Patterns and predictors of smoking relapse among inpatient smokers (PMC, 2021)',
    'Sage Freunden, dass du nicht rauchst, damit dir niemand etwas anbietet.',
  ),
  GittyDay(
    'In einer Auswertung machte mit 41,8 Prozent die größte Gruppe der Rückfälligen den Rückfall innerhalb von vier Wochen nach dem Stopp.',
    'Du bist gerade nah an diesem Fenster. Halte durch.',
    'Quelle: Factors Related to Smoking Relapse Within Six Months of Smoking Cessation (2023)',
    'Meide heute eine Situation, die dich triggern könnte.',
  ),
  GittyDay(
    'Rückfälle in den ersten sechs Monaten stehen laut einer Studie häufiger im Zusammenhang mit Abhängigkeit, Angst und Reizbarkeit.',
    'Wenn du angespannt bist, ist das ein Warnsignal und kein Urteil.',
    'Quelle: Reasons for smoking relapse according to time since quit attempt (SciELO, 2025)',
    'Mache bei Anspannung eine Atemübung: vier Sekunden ein, sechs Sekunden aus.',
  ),
  GittyDay(
    'Die Rückfallrate ist in den ersten Monaten hoch und sinkt dann mit der Dauer der Abstinenz stetig.',
    'Jeder Tag macht den nächsten leichter.',
    'Quelle: Reasons for smoking relapse according to time since quit attempt (SciELO, 2025)',
    'Zähle die Tage seit deinem Stopp und sag die Zahl laut.',
  ),
  GittyDay(
    'In einer Kohorte von Klinikpatienten waren innerhalb von sechs Monaten fast 60 Prozent rückfällig geworden.',
    'Die Zahl zeigt, wie schwer es ist, und wie viel es bedeutet, dass du weitermachst.',
    'Quelle: Patterns and predictors of smoking relapse among inpatient smokers (PMC, 2021)',
    'Lege jetzt fest, was du bei einem Ausrutscher tust: zurück auf Anfang, kein Aufgeben.',
  ),
  GittyDay(
    'Entzugssymptome klingen für die meisten innerhalb von ein bis drei Wochen ab.',
    'Verlangen nach Woche vier hat deshalb oft mit Gewohnheit und Situation zu tun, weniger mit körperlichem Entzug.',
    'Quelle: Handling relapse in smoking cessation (Internal and Emergency Medicine, 2012)',
    'Finde heraus, welche Gewohnheit bei dir mit Nikotin verknüpft war, und ersetze sie.',
  ),
  GittyDay(
    'Das Verlangen nach Nikotin lässt nach, je länger du abstinent bleibst.',
    'Auch wenn es einzelne harte Tage gibt, ist der Trend dein Freund.',
    'Quelle: HSE, Cravings and withdrawal when you stop smoking',
    'Notiere den Tag, an dem du dein Verlangen zuletzt deutlich gemerkt hast.',
  ),
  GittyDay(
    'Ein Monat: Du hast das Fenster mit dem höchsten Rückfallrisiko fast durchquert.',
    'Danach sinkt die Rate stetig.',
    'Quelle: Handling relapse in smoking cessation (2012); Reasons for smoking relapse (SciELO, 2025)',
    'Gönne dir heute etwas Besonderes von dem gesparten Geld.',
  ),
];

const _vaping4 = <GittyDay>[
  GittyDay(
    'Beim Rauchstopp werden etwa 80 Prozent derer, die ohne Hilfe aufhören, innerhalb des ersten Monats rückfällig.',
    'Die Zahl stammt vom Rauchen. Für Vapes ist die Datenlage dünner, der Verlauf dürfte ähnlich sein.',
    'Quelle: Handling relapse in smoking cessation (Internal and Emergency Medicine, 2012)',
    'Notiere deine drei stärksten Risikosituationen und deinen Plan für jede.',
  ),
  GittyDay(
    'Rückfälle passieren beim Nikotinstopp am häufigsten in den ersten Wochen.',
    'Die Beobachtung stammt aus Rauchstopp-Studien.',
    'Quelle: Patterns and predictors of smoking relapse among inpatient smokers (PMC, 2021)',
    'Sage Freunden, dass du nicht dampfst, damit dir niemand etwas anbietet.',
  ),
  GittyDay(
    'Rückfälle stehen laut einer Studie häufiger im Zusammenhang mit Abhängigkeit, Angst und Reizbarkeit.',
    'Wenn du angespannt bist, ist das ein Warnsignal und kein Urteil.',
    'Quelle: Reasons for smoking relapse according to time since quit attempt (SciELO, 2025)',
    'Mache bei Anspannung eine Atemübung: vier Sekunden ein, sechs Sekunden aus.',
  ),
  GittyDay(
    'Das Verlangen nach Nikotin lässt nach, je länger du abstinent bleibst.',
    'Es gibt harte Tage, aber der Trend zeigt nach unten.',
    'Quelle: HSE, Cravings and withdrawal when you stop smoking',
    'Notiere den Tag, an dem du dein Verlangen zuletzt deutlich gemerkt hast.',
  ),
  GittyDay(
    'Entzugssymptome klingen beim Rauchstopp für die meisten innerhalb von ein bis drei Wochen ab.',
    'Verlangen nach Woche vier ist deshalb oft Gewohnheit und Situation, weniger körperlicher Entzug.',
    'Quelle: Handling relapse in smoking cessation (Internal and Emergency Medicine, 2012)',
    'Finde heraus, welche Gewohnheit bei dir mit dem Vape verknüpft war, und ersetze sie.',
  ),
  GittyDay(
    'Die Rückfallrate sinkt mit der Dauer der Abstinenz stetig.',
    'Jeder Tag macht den nächsten leichter.',
    'Quelle: Reasons for smoking relapse according to time since quit attempt (SciELO, 2025)',
    'Zähle die Tage seit deinem Stopp und sag die Zahl laut.',
  ),
  GittyDay(
    'In einer Auswertung machte mit 41,8 Prozent die größte Gruppe der Rückfälligen den Rückfall innerhalb von vier Wochen.',
    'Du bist gerade in diesem Fenster. Es ist das härteste Stück.',
    'Quelle: Factors Related to Smoking Relapse Within Six Months of Smoking Cessation (2023)',
    'Meide heute eine Situation, die dich triggern könnte.',
  ),
  GittyDay(
    'In einer Kohorte waren innerhalb von sechs Monaten fast 60 Prozent der Aufhörenden rückfällig.',
    'Die Zahl zeigt, wie schwer es ist, und wie viel es bedeutet, dass du weitermachst.',
    'Quelle: Patterns and predictors of smoking relapse among inpatient smokers (PMC, 2021)',
    'Lege jetzt fest, was du bei einem Ausrutscher tust: zurück auf Anfang, kein Aufgeben.',
  ),
  GittyDay(
    'Ein Monat: Du hast das Fenster mit dem höchsten Rückfallrisiko fast durchquert.',
    'Daten zum Rauchstopp zeigen: Danach sinkt die Rate stetig.',
    'Quelle: Reasons for smoking relapse (SciELO, 2025); Handling relapse in smoking cessation (2012)',
    'Gönne dir heute etwas Besonderes von dem gesparten Geld.',
  ),
];

const _cocaine4 = <GittyDay>[
  GittyDay(
    'Kokainkonsumierende hatten in einer Studie einen höheren systolischen Blutdruck (134 gegenüber 126 mmHg), eine steifere Aorta und mehr Herzmuskelmasse.',
    'Dein Herz arbeitet gegen das Kokain, nicht mit ihm.',
    'Quelle: Acute and Chronic Effects of Cocaine on Cardiovascular Health (PMC, 2019)',
    'Miss heute deinen Blutdruck, falls du ein Gerät hast, oder gehe zu einer Apotheke.',
  ),
  GittyDay(
    'Die Funktion der linken Herzkammer kann sich nach anhaltender Abstinenz erholen, je nach Dauer des Konsums und Ausmaß der Schäden unterschiedlich stark.',
    'Es gibt Hoffnung, auch wenn das Herz schon gelitten hat.',
    'Quelle: European Society of Cardiology, Cocaine-induced heart failure (2026)',
    'Vereinbare einen Termin für einen Gesundheitscheck mit Blutdruck und EKG.',
  ),
  GittyDay(
    'Anhaltende Abstinenz ist der entscheidende Faktor für die Erholung der Herzfunktion und die Vorbeugung gegen Herzschwäche.',
    'Kokain gilt als umkehrbare Ursache von Herzschwäche.',
    'Quelle: European Society of Cardiology, Cocaine-induced heart failure (2026)',
    'Tu heute etwas Gutes für dein Herz: spazieren gehen oder die Treppe nehmen.',
  ),
  GittyDay(
    'In einer 12-Wochen-Studie sank der Blutdruck in der Gruppe mit den meisten kokainfreien Urinproben, auch ohne vollständige Abstinenz.',
    'Weniger Konsum hilft dem Herz bereits, aber mehr Abstinenz hilft mehr.',
    'Quelle: Contingency management and cardiovascular health in cocaine use disorder (2025)',
    'Suche dir ein Ziel für die kommende Woche, das du schaffen kannst.',
  ),
  GittyDay(
    'Forschende vermuten, dass es eine gewisse Schwelle an Abstinenz braucht, damit sich der Blutdruck bessert.',
    'Halbe Sachen helfen, ganze helfen mehr.',
    'Quelle: Recovery Research Institute, Can reducing cocaine use improve cardiovascular health? (2025)',
    'Erkenne an, dass jeder Tag ohne Konsum deinem Herzen nützt.',
  ),
  GittyDay(
    'Nach dem Absetzen kann es zu schneller Gewichtszunahme kommen, was Herz-Kreislauf-Risiken erhöhen kann.',
    'Das ist normal und kein Grund zur Panik, aber ein Grund, auf Essen und Bewegung zu achten.',
    'Quelle: Acute and Chronic Effects of Cocaine on Cardiovascular Health (PMC, 2019)',
    'Bewege dich heute 30 Minuten und iss regelmäßig.',
  ),
  GittyDay(
    'Die 12-Wochen-Studie testete Belohnungen für kokainfreie Urinproben, ein Ansatz namens Contingency Management.',
    'Belohnungen für Erfolge können helfen, dranzubleiben. Das darfst du auch ohne Studie für dich nutzen.',
    'Quelle: Contingency management and cardiovascular health in cocaine use disorder (2025)',
    'Lege fest, womit du dich für 30 Tage ohne Kokain belohnst.',
  ),
  GittyDay(
    'Berichte zeigen, dass sich nach längerer Abstinenz auch die Herzmuskelfunktion verbessern kann.',
    'Wie weit, hängt von der Dauer des Konsums und vom Schaden ab.',
    'Quelle: European Society of Cardiology, Cocaine-induced heart failure (2026)',
    'Notiere eine Gesundheitsfrage, die du ärztlich klären willst.',
  ),
  GittyDay(
    'Ein Monat: Du bist durch die heikelste Zeit des akuten Entzugs. Das Rückfallrisiko bleibt, daher ist Begleitung sinnvoll.',
    'Nachsorge länger durchzuhalten, ist laut Forschung ein Schutzfaktor.',
    'Quelle: Translational Research on Incubation of Cocaine Craving (PMC, 2016)',
    'Vereinbare einen festen Termin für Beratung oder Selbsthilfe und belohne dich.',
  ),
];

const _alcohol4 = <GittyDay>[
  GittyDay(
    'Eine Pause von einem Monat hilft Trinkenden laut Review, danach weniger zu trinken.',
    'Das Experiment Monat ohne Alkohol hat oft einen Effekt, der über den Monat hinausgeht.',
    'Quelle: Brown University School of Public Health, Dry January Review (2025)',
    'Schreibe auf, wie viel du in einem normalen Monat getrunken hast und was du dir stattdessen leisten kannst.',
  ),
  GittyDay(
    'Besserer Schlaf, durchschlafen und erholter aufwachen gehören zu den häufigsten berichteten Effekten eines Monats ohne Alkohol.',
    'Dein Schlaf ist der Taktgeber für Stimmung und Energie.',
    'Quelle: Mass General Brigham, Dry January Benefits (2026)',
    'Notiere, wie du heute Morgen aufgewacht bist.',
  ),
  GittyDay(
    'Ein Monat ohne Alkohol gibt Zeit, den Körper mit Nährstoffen zu versorgen und über das eigene Trinken nachzudenken.',
    'Es geht nicht nur um den Verzicht, sondern um das Hinschauen.',
    'Quelle: UC Davis Health, Dry January (2025)',
    'Schreibe auf, in welchen Situationen du am ehesten getrunken hast.',
  ),
  GittyDay(
    'Wer hohen Blutdruck hat, kann laut Alcohol Change UK von ein paar alkoholfreien Wochen profitieren.',
    'Das ist kein Ersatz für ärztliche Behandlung, aber ein Anfang.',
    'Quelle: Alcohol Change UK, Benefits of Dry January',
    'Lasse bei Bluthochdruck deine Werte beim Arzt prüfen.',
  ),
  GittyDay(
    'In einer Studie mit 294 ambulant Behandelten berichtete mehr als ein Drittel über Schlafprobleme in den ersten Wochen ohne Alkohol.',
    'Schlafprobleme sind häufig und verschwinden meist von selbst.',
    'Quelle: ScienceInsights, What happens to your body when you cut back on alcohol',
    'Halte heute Abend dein Schlafzimmer kühl, dunkel und ohne Handy.',
  ),
  GittyDay(
    'Die Studien zu Dry January sind meist klein und beruhen überwiegend auf Teilnehmenden, die freiwillig mitmachen.',
    'Die Ergebnisse gelten nicht automatisch für jeden, vor allem nicht für stark Abhängige.',
    'Quelle: A scoping review of Dry January (PMC, 2025)',
    'Entscheide ehrlich, ob du ohne Hilfe weitermachen kannst, und hole dir Hilfe, wenn nicht.',
  ),
  GittyDay(
    'Die Erholung des Körpers nach dem Alkoholstopp verläuft über Monate.',
    'Manche Veränderungen kommen schnell, andere brauchen lange.',
    'Quelle: ScienceInsights, What giving up alcohol actually does to the body',
    'Plane die nächsten drei Monate in Etappen von je vier Wochen.',
  ),
  GittyDay(
    'Selbst ein einzelner Tag Pause kann laut einer Zeitleiste von Forschenden Schlaf und Stimmung beeinflussen.',
    'Du musst nicht perfekt sein, um zu profitieren.',
    'Quelle: The Conversation, Even a day off alcohol makes a difference (2025)',
    'Hake heute einen weiteren Tag ab und sei stolz.',
  ),
  GittyDay(
    'Ein Monat: Menschen mit einem Monat Pause trinken laut Studien danach tendenziell langfristig weniger.',
    'Du hast die Hürde genommen, an der viele scheitern.',
    'Quelle: AARP, 8 Health Benefits of Quitting Alcohol for a Month',
    'Belohne dich heute mit etwas, das nichts mit Alkohol zu tun hat.',
  ),
];

const _social4 = <GittyDay>[
  GittyDay(
    'Studierende, deren Nutzung drei Wochen lang auf zehn Minuten pro Tag begrenzt war, hatten weniger Depression und Einsamkeit.',
    'Das Ergebnis stammt aus einem Experiment mit Kontrollgruppe.',
    'Quelle: Associations between social media use and loneliness (PMC, 2023)',
    'Begrenze heute deine Zeit in einer App auf zehn Minuten.',
  ),
  GittyDay(
    'Die Autoren der Harvard-Berichterstattung betonen, dass nicht jeder gleich profitiert und noch vieles unerforscht ist.',
    'Dein Weg kann anders aussehen als der Durchschnitt.',
    'Quelle: Harvard Gazette, Social media detox boosts mental health, but nuances stand out (2025)',
    'Frage dich, welche Inhalte dir guttun und welche nicht.',
  ),
  GittyDay(
    'Reduzierte Bildschirmzeit kann laut Zusammenfassung psychische Gesundheit, Schlaf und weitere Wohlbefindensmaße verbessern.',
    'Das Wichtigste ist die Gesamtzeit, nicht nur die einzelne App.',
    'Quelle: Georgetown University, Digital Detoxes Work (2025)',
    'Plane heute einen bildschirmfreien Spaziergang.',
  ),
  GittyDay(
    'Weniger Bildschirmzeit kann die Aufmerksamkeitsspanne deutlich verbessern.',
    'Das erleichtert Lesen, Gespräche und Arbeit.',
    'Quelle: Georgetown University, Digital Detoxes Work (2025)',
    'Lies heute 15 Minuten in einem Buch oder Artikel ohne Unterbrechung.',
  ),
  GittyDay(
    'Ein Zwei-Wochen-Versuch senkte die Handyzeit auf weniger als die Hälfte und verbesserte Aufmerksamkeit und Wohlbefinden.',
    'Weniger ist oft mehr, auch wenn es sich zuerst leer anfühlt.',
    'Quelle: PNAS Nexus, zitiert nach Blue Cross Blue Shield of Michigan (2026)',
    'Prüfe deine durchschnittliche Bildschirmzeit der letzten sieben Tage.',
  ),
  GittyDay(
    'Die Autoren einer Studie schließen, dass eine Begrenzung auf etwa 30 Minuten pro Tag das Wohlbefinden verbessern kann.',
    'Das Limit funktioniert, wenn du es dir selbst setzt.',
    'Quelle: Hunt et al., No More FOMO (2018)',
    'Stelle einen Timer ein und halte dich heute daran.',
  ),
  GittyDay(
    'Eine Woche Pause von Social Media senkte Angstsymptome um 16,1 Prozent, Depressionssymptome um 24,8 Prozent und Schlafprobleme um 14,5 Prozent.',
    'Das waren Durchschnittswerte bei jungen Erwachsenen.',
    'Quelle: JAMA Network Open (2025), zitiert nach Harvard Gazette',
    'Fasse zusammen, was du seit Beginn bei dir verändert hast.',
  ),
  GittyDay(
    'Digital-Detox-Studien zeigen Verbesserungen bei Depression, Schlaf und Aufmerksamkeit, aber die Langzeitwirkung ist noch offen.',
    'Dein Alltag entscheidet, was bleibt.',
    'Quelle: Digital detox: An effective solution in the smartphone era? (2022); Georgetown University (2025)',
    'Lege eine Regel fest, die du in drei Monaten noch gut findest.',
  ),
  GittyDay(
    'Ein Monat: Du hast die Dauer der meisten Detox-Studien erreicht oder überschritten.',
    'Alles, was jetzt kommt, ist deine eigene Auswertung.',
    'Quelle: Hunt et al., No More FOMO (2018); JAMA Network Open (2025)',
    'Belohne dich heute mit etwas, das nichts mit einem Bildschirm zu tun hat.',
  ),
];

const _porn4 = <GittyDay>[
  GittyDay(
    'Die ICD-11 grenzt zwanghaftes Sexualverhalten von bloßem hohem Konsum ab: Entscheidend sind Kontrollverlust und Leidensdruck.',
    'Es kommt nicht darauf an, wie oft, sondern ob du dein Verhalten steuern kannst.',
    'Quelle: Making sense of ICD-11 diagnostic criteria of compulsive sexual behavioural disorder (Annals Singapore, 2025)',
    'Notiere, ob dein Verhalten dein Leben beeinträchtigt hat und wie.',
  ),
  GittyDay(
    'Die WHO führt zwanghaftes Sexualverhalten in der ICD-11 als Störung der Impulskontrolle. In der Fachwelt gibt es dazu unterschiedliche Einordnungen.',
    'Dass Fachleute streiten, heißt nicht, dass dein Erleben falsch ist.',
    'Quelle: Compulsive sexual behaviour disorder (Wikipedia, Zusammenfassung); World Psychiatry, PMC 2018',
    'Nimm dir Zeit, deine eigenen Beobachtungen aufzuschreiben.',
  ),
  GittyDay(
    'In der Siebentagesstudie berichteten Teilnehmende mit geringer problematischer Nutzung keine Unterschiede im Verlangen zwischen Abstinenz- und Kontrollgruppe.',
    'Wer wenig Probleme hat, merkt die Pause kaum.',
    'Quelle: Effects of a 7-Day Pornography Abstinence Period (Archives of Sexual Behavior, 2023)',
    'Frage dich, ob deine Nutzung ein Problem war, und schreibe die Antwort auf.',
  ),
  GittyDay(
    'Erhöhtes Verlangen zeigte sich in der Studie nur bei täglicher Nutzung zusammen mit hoher problematischer Nutzung.',
    'Wenn dir die Pause schwerfällt, ist das ein ernst zu nehmendes Zeichen.',
    'Quelle: Effects of a 7-Day Pornography Abstinence Period (Archives of Sexual Behavior, 2023)',
    'Wenn es dir schwerfällt, such dir Unterstützung bei einer Beratungsstelle.',
  ),
  GittyDay(
    'Es gab bis 2023 nur drei Experimente zu Pornografie-Abstinenz, die längsten dauerten drei Wochen.',
    'Alles darüber hinaus beruht auf Erfahrung und nicht auf Beweisen.',
    'Quelle: Effects of a 7-Day Pornography Abstinence Period (Archives of Sexual Behavior, 2023); Negash et al. (2015)',
    'Prüfe, welche Behauptungen im Netz du bisher einfach geglaubt hast.',
  ),
  GittyDay(
    'In einer Studie war Abstinenz mit Anstrengung verbunden, aber nicht mit messbaren Entzugssymptomen.',
    'Es darf anstrengend sein, ohne dass es Entzug ist.',
    'Quelle: Effects of a 7-Day Pornography Abstinence Period (Archives of Sexual Behavior, 2023)',
    'Plane heute Aktivitäten für Zeiten, in denen du sonst nutzen würdest.',
  ),
  GittyDay(
    'Eine qualitative Studie beschreibt Rebooting-Gemeinschaften, in denen Mitglieder ihre Erfahrungen teilen. Sie belegt keine Wirkung.',
    'Austausch kann trotzdem helfen, wenn er ehrlich bleibt.',
    'Quelle: The Pornography Rebooting Experience (PMC, 2021)',
    'Suche dir eine Person, mit der du offen reden kannst.',
  ),
  GittyDay(
    'Das Verhalten, das du verändern willst, ist deine Entscheidung. Die Forschung gibt dir dafür nur einen Rahmen.',
    'Du bist nicht auf Beweise angewiesen, um zu wissen, was dir guttut.',
    'Quelle: Zusammenfassung der zitierten Studien (Archives of Sexual Behavior 2023; PMC 2021; ICD-11)',
    'Schreibe auf, was du in drei Monaten erreicht haben willst.',
  ),
  GittyDay(
    'Ein Monat: Das ist länger als jedes der drei bekannten Abstinenz-Experimente.',
    'Du sammelst jetzt selbst Erfahrung, die in der Forschung noch fehlt.',
    'Quelle: Effects of a 7-Day Pornography Abstinence Period (2023); Negash et al. (2015)',
    'Belohne dich heute mit etwas, das dir guttut.',
  ),
];
