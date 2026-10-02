import 'package:quitter/gitty_days.dart';
import 'package:quitter/gitty_tips.dart';
import 'package:quitter/quit_milestone.dart';

const gittyDailyMaxDay = 30;

List<QuitMilestone> gittyDailyMilestones(
  String storageKey,
  List<QuitMilestone> original,
) {
  if (gittyDayAll(storageKey, 1) == null) return original;
  final daily = <QuitMilestone>[];
  for (var d = 1; d <= gittyDailyMaxDay; d++) {
    final g = gittyDayAll(storageKey, d);
    if (g == null) break;
    final source = g.source.replaceFirst('Quelle: ', '');
    final tip = gittyTipFor(storageKey, d);
    final tipText = tip == null
        ? ''
        : '\n\nTipp: ${tip.title}. ${tip.text}'
              '${tip.humor == null ? '' : '\n\n${tip.humor}'}'
              '${tip.source == null ? '' : '\n\n${tip.source}'}';
    daily.add(
      QuitMilestone(
        day: d,
        title: 'Wissensimpuls',
        description:
            '${g.fact}\n\n${g.explanation}\n\nTagesmission: ${g.mission}$tipText',
        reference: source,
        link: 'https://duckduckgo.com/?q=${Uri.encodeQueryComponent(source)}',
      ),
    );
  }
  final rest = original.where((m) => m.day > daily.length);
  return [...daily, ...rest];
}
