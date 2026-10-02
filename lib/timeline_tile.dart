import 'package:flutter/material.dart';
import 'package:quitter/comic_style.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/milestone_reference_page.dart';
import 'package:quitter/quit_milestone.dart';
import 'package:url_launcher/url_launcher.dart';

class TimelineTile extends StatelessWidget {
  final QuitMilestone milestone;
  final bool isCompleted;
  final bool isNext;
  final bool isLast;
  final List<int> daysAchieved;

  const TimelineTile({
    super.key,
    required this.milestone,
    required this.isCompleted,
    required this.isNext,
    required this.isLast,
    this.daysAchieved = const [],
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final dark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final achievements = daysAchieved
        .where((days) => days == milestone.day)
        .toList();

    final line = colorScheme.outline;
    final isFuture = !isCompleted && !isNext;
    final bg = isCompleted
        ? comicMint
        : isNext
        ? comicYellow
        : colorScheme.surfaceContainerLow;
    final fg = isFuture ? colorScheme.onSurface : comicInk;
    final chipBg = isFuture ? line : comicInk;
    final chipFg = isFuture ? colorScheme.surface : Colors.white;
    final nodeFill = isCompleted
        ? comicMint
        : isNext
        ? comicYellow
        : colorScheme.surface;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: nodeFill,
                    border: Border.all(color: line, width: 3),
                  ),
                  child: isCompleted
                      ? const Icon(
                          Icons.check_rounded,
                          size: 18,
                          color: comicInk,
                        )
                      : isNext
                      ? const Icon(
                          Icons.play_arrow_rounded,
                          size: 18,
                          color: comicInk,
                        )
                      : Icon(
                          Icons.lock_outline,
                          size: 14,
                          color: colorScheme.onSurfaceVariant,
                        ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 4,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color: isCompleted ? line : colorScheme.outlineVariant,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 24, right: 4),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: isFuture ? colorScheme.outlineVariant : comicInk,
                  width: 2.5,
                ),
                boxShadow: isNext
                    ? [
                        BoxShadow(
                          color: dark ? comicRed : comicInk,
                          offset: const Offset(4, 4),
                        ),
                      ]
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: chipBg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          milestone.day >= 365
                              ? l10n.timelineMilestoneYears(
                                  (milestone.day / 365).round(),
                                )
                              : l10n.timelineMilestoneDay(milestone.day),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                            color: chipFg,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (achievements.isNotEmpty &&
                          achievements.length <= 5) ...[
                        Row(
                          children: achievements
                              .map(
                                (days) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 2.0,
                                  ),
                                  child: Icon(
                                    Icons.history,
                                    size: 18,
                                    color: fg,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ] else if (achievements.length > 5) ...[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.history, size: 18, color: fg),
                            const SizedBox(width: 2),
                            Text(
                              '${achievements.length}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: fg,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    milestone.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: fg,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    milestone.description,
                    style: TextStyle(fontSize: 15, height: 1.45, color: fg),
                  ),
                  const SizedBox(height: 14),
                  Material(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: comicInk, width: 2),
                    ),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onTap: () {
                        if (milestone.referenceContent != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  MilestoneReferencePage(milestone: milestone),
                            ),
                          );
                        } else {
                          launchUrl(Uri.parse(milestone.link));
                        }
                      },
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minHeight: 44),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.science_outlined,
                                size: 18,
                                color: comicInk,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  milestone.reference,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: comicInk,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.open_in_new,
                                size: 18,
                                color: comicInk,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
