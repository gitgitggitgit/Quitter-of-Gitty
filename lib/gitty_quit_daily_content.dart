class GittyQuitDailyContent {
  const GittyQuitDailyContent({
    required this.day,
    required this.title,
    required this.fact,
    required this.explanation,
    required this.source,
    required this.motivation,
    required this.mission,
  });

  final int day;
  final String title;
  final String fact;
  final String explanation;
  final String source;
  final String motivation;
  final String mission;
}

const gittyQuitPrototypeContent = GittyQuitDailyContent(
  day: 1,
  title: 'Wissensimpuls · Tag 1',
  fact:
      'Nach dem Rauchstopp beginnt der Kohlenmonoxidspiegel im Blut zu sinken.',
  explanation:
      'Dadurch kann der Sauerstofftransport im Körper schrittweise besser funktionieren.',
  source: 'Quelle: NHS / AWMF S3-Leitlinie',
  motivation: 'Heute wähle ich Freiheit.',
  mission: 'Lies deinen wichtigsten Grund bewusst durch.',
);
