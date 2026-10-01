class GittyDay {
  const GittyDay(this.fact, this.explanation, this.source, this.mission);

  final String fact;
  final String explanation;
  final String source;
  final String mission;
}

GittyDay? gittyDayFor(String habitKey, int dayNumber) {
  final track = switch (habitKey) {
    'marijuana' => _cannabis,
    'smoking' || 'nicotine_pouches' || 'smokeless_tobacco' => _nicotine,
    'vaping' => _vaping,
    'cocaine' => _cocaine,
    'alcohol' => _alcohol,
    'social_media' => _social,
    'pornography' => _porn,
    _ => null,
  };
  if (track == null || dayNumber < 1 || dayNumber > track.length) return null;
  return track[dayNumber - 1];
}

const _cannabis = <GittyDay>[
  GittyDay(
    'Entzugssymptome beginnen meist 24 bis 48 Stunden nach dem letzten Konsum.',
    'Heute spürst du vielleicht noch wenig. Schlafprobleme und Gereiztheit kündigen sich meist erst an.',
    'Quelle: Clinical management of cannabis withdrawal (Fachartikel, PMC 2022)',
    'Räume alles weg, was an Konsum erinnert, und plane den heutigen Abend ohne Konsum.',
  ),
  GittyDay(
    'Frühe Symptome sind meist Schlaflosigkeit, Gereiztheit, weniger Appetit und Zittrigkeit.',
    'Dein Körper stellt sich um. Das ist unangenehm, aber ein normales Zeichen und kein Scheitern.',
    'Quelle: Clinical management of cannabis withdrawal (Fachartikel, PMC 2022)',
    'Plane für den Abend, an dem das Verlangen meist am stärksten ist, einen Spaziergang oder ein Telefonat ein.',
  ),
  GittyDay(
    'Die Beschwerden sind meist um Tag 3 am stärksten.',
    'Übelkeit, Schwitzen und Unruhe sind möglich. Laut Fachartikel liegt der Gipfel der frühen Symptome zwischen Tag 2 und 6.',
    'Quelle: Cleveland Clinic und Fachartikel in PMC (2022)',
    'Iss regelmäßig, auch wenn der Appetit fehlt, und trinke über den Tag verteilt genug Wasser.',
  ),
  GittyDay(
    'Laut der britischen Suchtberatung WithYou erreichen die Beschwerden etwa vier Tage nach dem Stopp ihren Höhepunkt.',
    'Je nach Konsummenge fällt das unterschiedlich aus. Wer ganz aufhört, spürt es meist stärker als jemand, der nur reduziert.',
    'Quelle: WithYou, Coping with cannabis withdrawal',
    'Sag einer Person, der du vertraust, dass heute ein schwerer Tag ist.',
  ),
  GittyDay(
    'Die meisten Symptome klingen laut WithYou nach etwa 10 Tagen ab, bei manchen dauern sie bis zu vier Wochen.',
    'Du bist über den Gipfel. Dass einzelne Beschwerden bleiben, ist kein Rückschritt.',
    'Quelle: WithYou, Coping with cannabis withdrawal',
    'Gehe heute zur gleichen Uhrzeit ins Bett wie gestern und lege das Handy vorher weg.',
  ),
  GittyDay(
    'Körperliche und seelische Beschwerden erreichen oft in der ersten Woche ihren Gipfel und können bis zu drei Wochen oder länger anhalten.',
    'Holpriger Schlaf oder lebhafte Träume bedeuten nicht, dass du scheiterst. Sie gehören zur Umstellung.',
    'Quelle: Medical News Today, Weed withdrawal (mit Bezug auf eine Übersichtsarbeit von 2022)',
    'Schreibe auf, was du heute ohne Konsum geschafft hast.',
  ),
  GittyDay(
    'Gereiztheit, Wut und gedrückte Stimmung können ab etwa einer Woche auftreten und erreichen oft nach zwei Wochen ihren Höhepunkt.',
    'Sieben Tage sind geschafft. Stimmungstiefs können noch kommen und gehen wieder vorbei. Wenn sie sehr stark werden, sprich mit einer Ärztin oder einem Arzt.',
    'Quelle: Clinical management of cannabis withdrawal (Fachartikel, PMC 2022)',
    'Lege einen Teil des gesparten Geldes zur Seite und belohne dich damit.',
  ),
];

const _nicotine = <GittyDay>[
  GittyDay(
    'Entzugssymptome beginnen vier bis 24 Stunden nach der letzten Dosis Nikotin.',
    'Die ersten Stunden sind oft von Unruhe und Verlangen geprägt. Jede Stunde zählt.',
    'Quelle: Cleveland Clinic, Nicotine Withdrawal Symptoms',
    'Entsorge heute alle Reste, Päckchen und Zubehör, auch die Reserve.',
  ),
  GittyDay(
    'Wenn du geraucht hast: Nach etwa 12 Stunden ist das Kohlenmonoxid im Blut wieder auf normalem Niveau, und das Herzinfarktrisiko beginnt nach 24 Stunden zu sinken.',
    'Dein Blut transportiert wieder mehr Sauerstoff. Das ist der erste messbare Gewinn.',
    'Quelle: Medical News Today, Timeline after quitting smoking; Smokefree Plymouth',
    'Schreibe die drei Situationen auf, in denen du sonst zu Nikotin greifst, und lege für jede eine Alternative fest.',
  ),
  GittyDay(
    'Die Entzugssymptome sind meist am zweiten oder dritten Tag am stärksten.',
    'Reizbarkeit, Unruhe und Verlangen erreichen jetzt ihren Gipfel. Danach werden sie schwächer.',
    'Quelle: Cleveland Clinic, Nicotine Withdrawal Symptoms',
    'Halte Wasser, einen Apfel oder zuckerfreien Kaugummi bereit.',
  ),
  GittyDay(
    'Ein einzelnes Verlangen dauert meist nur 10 bis 15 Minuten.',
    'Du musst nicht den ganzen Tag durchhalten, nur die nächsten Minuten.',
    'Quelle: Allen Carr, Nicotine withdrawal timeline',
    'Wenn das Verlangen kommt, stelle einen Timer auf zehn Minuten und mache in der Zeit etwas anderes.',
  ),
  GittyDay(
    'Negative Gefühle durch den Nikotinentzug erreichen innerhalb einer Woche ihren Gipfel und können zwei bis vier Wochen anhalten.',
    'Gereiztheit oder gedrückte Stimmung sind kein Zeichen von Schwäche, sondern Teil des Entzugs.',
    'Quelle: National Cancer Institute, Tips for Coping with Nicotine Withdrawal',
    'Sag deinem Umfeld, dass du gerade empfindlicher bist.',
  ),
  GittyDay(
    'Nach etwa 72 Stunden lässt das Verlangen laut Healthline oft nach, und die Beschwerden dauern insgesamt meist nur wenige Wochen.',
    'Das Schwerste liegt hinter dir. Auch wenn es nicht so wirkt, ist der Verlauf auf deiner Seite.',
    'Quelle: Healthline, Nicotine withdrawal timeline',
    'Rechne aus, wie viel Geld du bisher gespart hast, und schau es dir an.',
  ),
  GittyDay(
    'Eine Woche: Die intensivsten Symptome liegen laut Healthline in den ersten zwei bis drei Tagen und damit hinter dir.',
    'Neue Verlangenswellen können noch kommen, aber du kennst jetzt ihr Muster.',
    'Quelle: Healthline, Nicotine withdrawal timeline',
    'Notiere, welche Situation diese Woche am schwersten war und was geholfen hat.',
  ),
];

const _vaping = <GittyDay>[
  GittyDay(
    'Entzugssymptome beginnen vier bis 24 Stunden nach der letzten Dosis Nikotin.',
    'Die ersten Stunden sind oft von Unruhe und Verlangen geprägt.',
    'Quelle: Cleveland Clinic, Nicotine Withdrawal Symptoms',
    'Entsorge Geräte, Liquids, Pods und Ladekabel.',
  ),
  GittyDay(
    'Das Verlangen kommt in Wellen von etwa 10 bis 20 Minuten, nicht als Dauerzustand.',
    'Jede Welle steigt, erreicht einen Gipfel und geht wieder.',
    'Quelle: ScienceInsights, What to expect when you quit vaping',
    'Stelle bei jedem Drang einen Timer auf 15 Minuten und lenke dich ab.',
  ),
  GittyDay(
    'Tag drei ist meist der schwerste: Verlangen, Stimmung und Konzentration sind am schlechtesten.',
    'Kopfschmerzen und Konzentrationsprobleme sind jetzt normal.',
    'Quelle: ScienceInsights, What to expect when you quit vaping',
    'Plane heute möglichst wenig Anspruchsvolles und gönne dir Ruhe.',
  ),
  GittyDay(
    'Von Tag vier bis 14 lassen die Symptome nach, die Energie schwankt aber noch.',
    'Der Gipfel liegt hinter dir, einzelne schlechte Stunden gehören noch dazu.',
    'Quelle: ScienceInsights, What to expect when you quit vaping',
    'Gehe 15 Minuten an die frische Luft.',
  ),
  GittyDay(
    'Reizbarkeit, Frust und ein kurzer Geduldsfaden sind in der ersten Woche fast durchgängig.',
    'Das trifft nicht deine Persönlichkeit, sondern den Entzug. Manche fühlen sich auch traurig oder ängstlich.',
    'Quelle: ScienceInsights, What to expect when you quit vaping',
    'Sag deinem Umfeld, dass du gerade empfindlicher bist.',
  ),
  GittyDay(
    'Die psychischen Symptome folgen demselben Verlauf wie die körperlichen: Gipfel in der ersten Woche, Abklingen innerhalb von zwei bis vier Wochen.',
    'Wenn die Stimmung sehr gedrückt bleibt, sprich mit einer Ärztin oder einem Arzt.',
    'Quelle: ScienceInsights, What to expect when you quit vaping',
    'Schau dir an, wie viel Geld du bisher nicht ausgegeben hast.',
  ),
  GittyDay(
    'Zwischen Tag 14 und 21 stellen sich die Nikotinrezeptoren im Gehirn laut ScienceInsights wieder auf das Niveau von Nichtrauchern ein.',
    'Eine Woche geschafft, die Erholung geht weiter.',
    'Quelle: ScienceInsights, What to expect when you quit vaping',
    'Überlege, in welchen Situationen du in den nächsten Wochen am meisten gefährdet bist, und plane dafür.',
  ),
];

const _cocaine = <GittyDay>[
  GittyDay(
    'Nach dem Absetzen beginnt oft ein Crash mit Erschöpfung, gedrückter Stimmung, Heißhunger, Schlafbedürfnis und Verlangen.',
    'Er kann innerhalb von Stunden beginnen. Dein Gehirn muss sich ohne den Dopaminschub neu einpendeln.',
    'Quelle: Rehabs.Today, Cocaine Withdrawal: Symptoms, Timeline and Treatment',
    'Sorge heute für Essen, Wasser und viel Schlaf. Ruhen ist erlaubt.',
  ),
  GittyDay(
    'An den Tagen 2 bis 4 bleiben Müdigkeit, gedrückte Stimmung, Reizbarkeit, veränderter Appetit, Schlafstörungen und Verlangen oft deutlich spürbar.',
    'Die Stimmung kann stark sinken. Bei dunklen Gedanken wende dich sofort an die Telefonseelsorge unter 0800 111 0 111 oder an den Notruf 112.',
    'Quelle: Rehabs.Today, Cocaine Withdrawal: Symptoms, Timeline and Treatment',
    'Bleibe heute in Kontakt mit einem Menschen, der nicht konsumiert.',
  ),
  GittyDay(
    'Viele akute Entzugssymptome von Stimulanzien bessern sich laut SAMHSA nach etwa 2 bis 10 Tagen.',
    'Du bist mittendrin. Die Richtung ist Besserung, auch wenn es sich noch nicht so anfühlt.',
    'Quelle: Rehabs.Today mit Bezug auf SAMHSA',
    'Meide heute Orte und Kontakte, die mit Konsum verknüpft sind.',
  ),
  GittyDay(
    'Bestimmte Orte, Uhrzeiten und sogar Gerüche können starkes Verlangen auslösen.',
    'Das ist eine erlernte Verknüpfung und kein Zeichen von Schwäche.',
    'Quelle: Rock View Recovery, Cocaine Withdrawal Timeline',
    'Schreibe drei Auslöser auf und überlege, wie du jedem ausweichst.',
  ),
  GittyDay(
    'Das Verlangen ist in den ersten ein bis vier Wochen am stärksten, kann aber zeitweise über Monate wiederkehren.',
    'Rückkehrendes Verlangen ist normal und bedeutet nicht, dass du von vorn anfängst.',
    'Quelle: Clean and Recovery, Cocaine Withdrawal',
    'Lege fest, wen du anrufst, wenn das Verlangen kommt, und speichere die Nummer.',
  ),
  GittyDay(
    'In den ersten ein bis zwei Wochen sind Niedergeschlagenheit, Freudlosigkeit, Konzentrationsprobleme, unruhiger Schlaf mit lebhaften Träumen und Verlangen am stärksten, danach lassen sie nach.',
    'Wenn alles flach wirkt, ist das ein bekannter Teil der Erholung.',
    'Quelle: AddictionHelp.com, Cocaine Withdrawal Symptoms',
    'Plane eine Kleinigkeit, die dir früher Freude gemacht hat, auch wenn sie sich zunächst flach anfühlt.',
  ),
  GittyDay(
    'Professionelle Begleitung verbessert die Chancen auf dauerhafte Abstinenz deutlich.',
    'Sieben Tage sind ein starker Anfang. Die Wochen danach sind oft emotional, mit Hilfe fällt es leichter.',
    'Quelle: Rock View Recovery, Cocaine Withdrawal Timeline',
    'Suche eine Suchtberatungsstelle in deiner Nähe und notiere dir die Kontaktdaten.',
  ),
];

const _alcohol = <GittyDay>[
  GittyDay(
    'Bei starkem, regelmäßigem Konsum können Entzugssymptome sechs bis 24 Stunden nach dem letzten Drink beginnen.',
    'Wer täglich oder fast täglich trinkt, sollte nicht ohne ärztliche Begleitung aufhören, denn Alkoholentzug kann lebensgefährlich sein.',
    'Quelle: Cleveland Clinic, Alcohol Withdrawal; Verywell Health',
    'Wenn du regelmäßig getrunken hast, sprich heute mit deiner Hausärztin, deinem Hausarzt oder einer Suchtberatung. Räume Alkohol aus der Wohnung.',
  ),
  GittyDay(
    'Die Symptome erreichen meist 24 bis 72 Stunden nach dem letzten Drink ihren Höhepunkt.',
    'Das Krampfrisiko ist 24 bis 48 Stunden nach dem letzten Drink am höchsten. Bei Zittern, Verwirrtheit, Halluzinationen oder Krämpfen rufe sofort den Notruf 112.',
    'Quelle: Cleveland Clinic, Alcohol Withdrawal',
    'Bleibe heute nicht allein und sag jemandem, wie es dir geht.',
  ),
  GittyDay(
    'Bei den meisten mit leichtem bis mittlerem Entzug klingen die Symptome nach etwa 72 Stunden ab.',
    'Halten Beschwerden darüber hinaus an, sprich mit deinem Arzt oder deiner Ärztin.',
    'Quelle: Verywell Health, What to Expect From Alcohol Withdrawal Symptoms',
    'Trinke viel Wasser und iss regelmäßig.',
  ),
  GittyDay(
    'Der Schlaf ist in der frühen Abstinenz oft gestört: In einer Studie brauchten Männer in früher Genesung im Schnitt 24 statt 10 Minuten zum Einschlafen und schliefen rund 35 Minuten kürzer.',
    'Schlecht zu schlafen bedeutet nicht, dass der Verzicht falsch ist.',
    'Quelle: ScienceInsights, What happens to your body when you cut back on alcohol',
    'Gehe zur gleichen Zeit ins Bett und lege das Handy vor dem Schlafen weg.',
  ),
  GittyDay(
    'Alkohol unterdrückt die REM-Phase im Schlaf, daher sortiert sich der Schlaf erst nach und nach neu.',
    'Dein Schlaf braucht Zeit, sich zu erholen, und wird nicht sofort besser.',
    'Quelle: ScienceInsights, What happens to your body when you cut back on alcohol',
    'Plane den Abend, an dem du sonst getrunken hast, mit einer festen Alternative.',
  ),
  GittyDay(
    'Wer lange getrunken hat, kann auch Wochen bis Monate nach dem letzten Drink noch Verlangen, Reizbarkeit und Schlafprobleme spüren.',
    'Das nennt sich postakutes Entzugssyndrom und ist kein Rückfall.',
    'Quelle: Verywell Health, What to Expect From Alcohol Withdrawal Symptoms',
    'Schreibe auf, was du heute besser merkst.',
  ),
  GittyDay(
    'Nach einer Woche ohne Alkohol bemerken die meisten besseren Schlaf, klareres Denken und stabilere Energie, die Schlafqualität schwankt aber in den ersten 30 Tagen stark.',
    'Eine Woche ist geschafft. Das Auf und Ab beim Schlaf ist normal.',
    'Quelle: ScienceInsights, What happens when you stop drinking alcohol for a week',
    'Such dir Unterstützung: eine Suchtberatung oder eine Selbsthilfegruppe in deiner Nähe.',
  ),
];

const _social = <GittyDay>[
  GittyDay(
    'In einer randomisierten Studie mit 154 Personen verbesserte eine Woche Pause von Facebook, Instagram, Twitter und TikTok das Wohlbefinden und senkte Depressions- und Angstwerte.',
    'YouTube war nicht Teil dieser Studie. Der Effekt lief laut Studie teilweise über weniger Nutzungszeit.',
    'Quelle: Lambert et al., Cyberpsychology, Behavior, and Social Networking (2022)',
    'Lösche heute die Apps vom Startbildschirm oder melde dich ab.',
  ),
  GittyDay(
    'Der Zugewinn an Wohlbefinden entstand laut Studie teilweise dadurch, dass die Teilnehmenden insgesamt weniger Minuten auf Social Media verbrachten.',
    'Weniger Zeit ist der Hebel, nicht Verzicht um des Verzichts willen.',
    'Quelle: Lambert et al., Cyberpsychology, Behavior, and Social Networking (2022)',
    'Sieh nach, wie viele Stunden du gestern am Handy verbracht hast.',
  ),
  GittyDay(
    'Die Verbesserung bei Depression und Angst hing vor allem mit weniger Zeit auf Twitter und TikTok zusammen, bei Angst allein mit TikTok.',
    'Nicht jede Plattform wirkt gleich. Beobachte, welche dich nach der Nutzung schlechter fühlen lässt.',
    'Quelle: Lambert et al., Cyberpsychology, Behavior, and Social Networking (2022)',
    'Schalte heute die Benachrichtigungen aller Apps aus.',
  ),
  GittyDay(
    'Laut einem Bericht über eine Studie bei jungen Erwachsenen sanken durch eine Woche weniger Social Media die Depressionssymptome um 24,8 Prozent und die Schlafprobleme um 14,5 Prozent.',
    'Schon kurze Pausen können sich auf Stimmung und Schlaf auswirken.',
    'Quelle: Medical Dialogues, One-week social media reduction improves mental well-being',
    'Wenn du warten musst, greife nicht zum Handy, sondern schau dich um.',
  ),
  GittyDay(
    'Ob diese Effekte langfristig anhalten, ist laut den Studienautoren noch offen.',
    'Eine Woche ist ein Anfang, aber noch kein Beweis für dauerhafte Wirkung. Dein Verhalten entscheidet darüber.',
    'Quelle: Medical Dialogues, One-week social media reduction improves mental well-being',
    'Notiere, wann du heute zum Handy gegriffen hast und warum.',
  ),
  GittyDay(
    'Beim Wohlbefinden lag der Unterschied zur Kontrollgruppe bei 4,9 Punkten, bei Depression bei minus 2,2 und bei Angst bei minus 1,7.',
    'Das sind Mittelwerte der Studie, keine Garantie für dich, aber ein Hinweis auf die Richtung.',
    'Quelle: Lambert et al., Cyberpsychology, Behavior, and Social Networking (2022)',
    'Verabrede dich heute persönlich oder per Anruf mit jemandem.',
  ),
  GittyDay(
    'Die Studie dauerte genau eine Woche. Das hast du jetzt selbst nachgemacht.',
    'Prüfe, was sich bei dir verändert hat: Stimmung, Schlaf, Konzentration.',
    'Quelle: Lambert et al., Cyberpsychology, Behavior, and Social Networking (2022)',
    'Entscheide, welche App oder welchen Kanal du dauerhaft nicht mehr nutzt.',
  ),
];

const _porn = <GittyDay>[
  GittyDay(
    'In einer randomisierten Studie mit 176 regelmäßigen Nutzern zeigten sich bei sieben Tagen Abstinenz keine Hinweise auf Entzugssymptome.',
    'Die Teilnehmenden hatten eher niedrige problematische Nutzung. Das Ergebnis gilt nicht automatisch für dich.',
    'Quelle: Effects of a 7-Day Pornography Abstinence Period, Archives of Sexual Behavior (2023)',
    'Lösche heute Lesezeichen, Konten, Apps und Verläufe, die dich zurückführen.',
  ),
  GittyDay(
    'Die Abstinenzgruppe nutzte pro Tag im Schnitt 0,27 Mal Pornografie, die Kontrollgruppe 0,93 Mal.',
    'Es ist machbar, die Nutzung in einer Woche deutlich zu senken.',
    'Quelle: Effects of a 7-Day Pornography Abstinence Period, Archives of Sexual Behavior (2023)',
    'Nutze Handy und Laptop abends nicht im Bett.',
  ),
  GittyDay(
    'Erhöhtes Verlangen zeigte sich in der Studie nur bei täglicher Nutzung in Kombination mit hoher problematischer Nutzung.',
    'Das war eine vorsichtige Zusatzanalyse. Wenn es dir schwerfällt, ist das kein Zeichen von Charakterschwäche.',
    'Quelle: Effects of a 7-Day Pornography Abstinence Period, Archives of Sexual Behavior (2023)',
    'Benenne den Moment, in dem der Drang kommt: Langeweile, Stress oder Einsamkeit.',
  ),
  GittyDay(
    'Abstinenz kostete Anstrengung: Die Abstinenzgruppe gab fast fünfmal so viel Abstinenzanstrengung an wie die Kontrollgruppe.',
    'Es ist normal, dass es sich nach Arbeit anfühlt.',
    'Quelle: Effects of a 7-Day Pornography Abstinence Period, Archives of Sexual Behavior (2023)',
    'Plane für den Zeitraum, in dem du sonst nutzt, eine konkrete Tätigkeit ein.',
  ),
  GittyDay(
    'Die WHO führt die zwanghafte Sexualverhaltensstörung in der ICD-11 als Störung der Impulskontrolle, nicht als Suchterkrankung.',
    'Entscheidend sind Kontrollverlust und Leidensdruck, nicht moralische Bewertung.',
    'Quelle: Compulsive sexual behaviour disorder in the ICD-11 (World Psychiatry, PMC 2018)',
    'Frage dich, ob du Kontrolle über dein Verhalten hast, und schreibe die Antwort auf.',
  ),
  GittyDay(
    'Studien mit zwei bis drei Wochen Abstinenz in nicht klinischen Gruppen deuten auf positive Effekte hin, etwa mehr Bindung in der Partnerschaft und weniger Neigung zu schneller Belohnung.',
    'Die Studienlage ist dünn und die Ursachen sind nicht eindeutig geklärt.',
    'Quelle: The Pornography Rebooting Experience (PMC, 2021)',
    'Notiere, wie deine Stimmung und dein Fokus heute sind, auf einer Skala von 0 bis 10.',
  ),
  GittyDay(
    'Zu den Merkmalen einer Störung zählen laut ICD-11 viele erfolglose Versuche, das Verhalten zu verringern.',
    'Wenn du immer wieder scheiterst, ist professionelle Hilfe ein Zeichen von Stärke. Sieben Tage sind ein guter Anfang.',
    'Quelle: Compulsive sexual behaviour disorder in the ICD-11 (World Psychiatry, PMC 2018)',
    'Suche eine Beratungsstelle oder Therapie und notiere dir die Kontaktdaten.',
  ),
];
