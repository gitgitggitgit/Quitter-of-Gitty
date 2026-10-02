class GittyTip {
  const GittyTip({
    required this.id,
    required this.title,
    required this.text,
    this.humor,
    this.source,
    this.onlyFor = const {},
    this.notFor = const {},
  });

  final String id;
  final String title;
  final String text;
  final String? humor;
  final String? source;
  final Set<String> onlyFor;
  final Set<String> notFor;

  bool appliesTo(String habitKey) =>
      (onlyFor.isEmpty || onlyFor.contains(habitKey)) &&
      !notFor.contains(habitKey);
}

List<GittyTip> gittyTipsFor(String habitKey) =>
    gittyTips.where((t) => t.appliesTo(habitKey)).toList();

GittyTip? gittyTipFor(String habitKey, int dayNumber) {
  final eligible = gittyTipsFor(habitKey);
  if (eligible.isEmpty || dayNumber < 1) return null;
  final offset = habitKey.codeUnits.fold<int>(0, (a, b) => a + b);
  return eligible[(dayNumber - 1 + offset) % eligible.length];
}

const gittyTips = <GittyTip>[
  GittyTip(
    id: 'thirty_minute_deal',
    title: '30-Minuten-Deal',
    text:
        'Wenn seelischer Druck kommt, halte ihn 30 Minuten aus. Danach prüfst du neu, ob du dich wirklich betäuben musst. Verlangen kommt in Wellen und flaut oft nach einer Weile ab. Das gilt für seelischen Druck. Bei körperlichen Entzugszeichen wie Krampf oder Verwirrtheit rufst du 112.',
    humor:
        'Dein Dealer hat dir nie 30 Minuten Bedenkzeit gegeben. Gönn sie dir selbst.',
    source:
        'Quelle: Mindfulness interventions for craving reduction (BMC Neuroscience, 2023)',
  ),
  GittyTip(
    id: 'busy_hands',
    title: 'Hände beschäftigen',
    text:
        'Wenn der Suchtdruck kommt, gib deinen Händen eine Aufgabe: Knetball, Karten mischen, zeichnen, Gemüse schnippeln oder ein Instrument.',
    humor: 'Deine Hände sind zum Anpacken da, nicht zum Abstürzen.',
    source:
        'Quelle: Effect of cognitive distraction on alcohol cue reactivity (2019): Ablenkung senkte den Trinkdrang',
  ),
  GittyTip(
    id: 'move_instead',
    title: 'Bewegung statt Betäubung',
    text:
        'Mach 5 bis 30 Minuten Bewegung: Liegestütze, Treppen, Seilspringen oder ein flotter Spaziergang. Bei Rauchern senkte schon eine kurze Einheit das Verlangen für bis zu 30 Minuten. Ist dein Körper im Entzug geschwächt, bleib bei einem ruhigen Spaziergang.',
    humor: 'Liegestütze: Der einzige Rausch, bei dem der Kater Muskelkater heißt.',
    source:
        'Quelle: Exercise-based interventions for smoking cessation (PMC, 2026)',
  ),
  GittyTip(
    id: 'training_plan',
    title: 'Sportprogramm aufstellen',
    text:
        'Lege drei feste Trainingszeiten pro Woche fest und trage sie wie Termine ein. Wer einen Plan hat, muss im Moment des Drucks nicht erst nachdenken. Fang leicht an und steigere langsam.',
    source:
        'Quelle: The effect of exercise interventions on substance-use outcomes (Meta-Analyse, PMC, 2025)',
  ),
  GittyTip(
    id: 'cold_shower',
    title: 'Kalt duschen',
    text:
        'Stell dich 30 bis 60 Sekunden unter kaltes Wasser. Das lenkt ab und holt dich zurück in den Körper. Das ist ein Erfahrungstipp ohne gute Studienlage. Lass es bei Kreislaufproblemen bleiben.',
    humor: 'Der Teufel auf deiner Schulter holt sich dabei auch einen Schnupfen.',
    notFor: {'benzos', 'alcohol'},
  ),
  GittyTip(
    id: 'write_it_down',
    title: 'Aufschreiben, was du fühlst',
    text:
        'Schreibe fünf Minuten ungefiltert auf, was gerade in dir los ist. Gefühle, die auf Papier stehen, nehmen im Kopf oft weniger Platz ein. Das ist ein Erfahrungstipp.',
    humor: 'Dein Tagebuch ist verschwiegener als jeder Kumpel an der Theke.',
  ),
  GittyTip(
    id: 'go_outside',
    title: 'Raus an die Luft',
    text:
        'Geh vor die Tür und schau in die Ferne: Park, Feld, Fluss. Schon eine Runde um den Block verändert die Lage.',
    humor: 'Draußen gibt es Licht, Luft und niemanden, der dir Nachschub andreht.',
  ),
  GittyTip(
    id: 'future_cinema',
    title: 'Zukunftskino',
    text:
        'Male dir fünf Minuten lang aus, wie dein Leben in einem Jahr aussieht, wenn du dranbleibst. Wo wohnst du, wie fühlst du dich, was machst du morgens?',
    humor: 'Eintritt frei, Popcorn optional, keine Werbepausen für Drinks.',
  ),
  GittyTip(
    id: 'think_of_someone',
    title: 'An jemanden denken, den du liebst',
    text:
        'Denk an einen Menschen, der dir wichtig ist, und ruf ihn an oder schreib ihm. Du musst nichts erklären, ein kurzes Ich denk an dich reicht.',
  ),
  GittyTip(
    id: 'cook_instead',
    title: 'Kochen statt Kämpfen',
    text:
        'Mach dir etwas Frisches, zum Beispiel einen Gazpacho. Schnippeln, mixen und probieren beschäftigt Hände und Kopf, und am Ende gibt es etwas Gutes.',
    humor: 'Kaltes Süppchen statt kalter Entzug.',
  ),
  GittyTip(
    id: 'fill_with_input',
    title: 'Stille mit Input füllen, der dich weiterbringt',
    text:
        'Wenn die Stille drückt und du sie füllen musst, dann mit etwas, das dich weiterbringt: Hörbuch, Podcast, Sprachkurs oder ein Tutorial.',
    humor: 'Dein Gehirn wollte schon immer mal etwas Sinnvolles hören.',
  ),
  GittyTip(
    id: 'give_silence_room',
    title: 'Der Stille Raum geben',
    text:
        'Übe, die Stille auszuhalten: fünf Minuten Meditation, Yoga, aus dem Fenster in die Landschaft schauen oder ein Spaziergang ohne Kopfhörer.',
    humor: 'Die Stille beißt nicht. Sie hat nur keinen Lieferdienst.',
    source:
        'Quelle: Mindfulness interventions for craving reduction (BMC Neuroscience, 2023)',
  ),
  GittyTip(
    id: 'wiesn_powder',
    title: 'Wiesn-Pulver als Ritual-Ersatz',
    text:
        'Wenn dir vor allem das Schnupfen fehlt: Weißes Schnupfpulver aus Traubenzucker und Menthol, oft Wiesnkoks genannt, ist als tabakfrei ausgewiesen ohne Tabak und Nikotin. Prüfe die Packung, denn manche Schnupfmittel enthalten Nikotin. Nimm es nur gelegentlich, denn es kann die Nasenschleimhaut reizen.',
    humor: 'Sieht aus wie Koks, wirkt wie Mundspülung für die Nase.',
    source:
        'Quelle: Süddeutsche Zeitung, Was ist das weiße Pulver namens Wiesn-Koks? (2025); tz München (2025)',
    onlyFor: {'smokeless_tobacco', 'nicotine_pouches'},
  ),
  GittyTip(
    id: 'mocktails',
    title: 'Alkoholfreie Cocktails',
    text:
        'Mix dir einen alkoholfreien Cocktail mit Eis, Kräutern und Schirmchen. Das Ritual bleibt, der Alkohol nicht.',
    humor: 'Sieht aus wie Selbstbetrug, schmeckt nach Selbstachtung.',
    onlyFor: {'alcohol'},
  ),
  GittyTip(
    id: 'strongest_moment',
    title: 'Dein stärkster Moment',
    text:
        'Erinnere dich an Zeiten, in denen du nicht konsumiert hast, etwa während einer Krankheit oder in einer längeren Pause. Wie hast du dich da gefühlt? Schreibe das Gefühl auf und lies es, wenn der Druck kommt.',
    humor: 'Beweisfoto vom Ich, das es schon mal konnte.',
  ),
];
