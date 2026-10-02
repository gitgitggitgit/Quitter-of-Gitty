import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quitter/comic_style.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/utils.dart';

class QuitCard extends StatelessWidget {
  const QuitCard({
    super.key,
    required this.context,
    required this.title,
    required this.heroTag,
    required this.icon,
    required this.gradientColors,
    required this.quitDate,
    required this.onTap,
    this.onDelete,
    this.onRename,
  });

  final BuildContext context;
  final String title;
  final Object heroTag;
  final IconData icon;
  final List<Color> gradientColors;
  final String? quitDate;
  final VoidCallback onTap;

  /// When non-null, shows a delete badge in the top-right corner.
  final VoidCallback? onDelete;

  /// When non-null, shows a rename badge in the bottom-right corner.
  final VoidCallback? onRename;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final parsedQuitDate = quitDate == null
        ? null
        : DateTime.tryParse(quitDate!);
    final days = parsedQuitDate == null
        ? null
        : daysCeil(parsedQuitDate.toIso8601String());
    final editing = onDelete != null || onRename != null;

    final accent = gradientColors.last;
    final fill = Color.lerp(gradientColors.first, Colors.white, 0.72)!;
    final shadow = dark
        ? Color.lerp(gradientColors.first, Colors.white, 0.35)!
        : comicInk;

    final card = Hero(
      tag: heroTag,
      child: Padding(
        padding: const EdgeInsets.only(right: 4, bottom: 4),
        child: Container(
          decoration: BoxDecoration(
            color: fill,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: comicInk, width: 3),
            boxShadow: [BoxShadow(color: shadow, offset: const Offset(4, 4))],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(17),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: accent,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: comicInk, width: 2.5),
                      ),
                      child: Icon(
                        icon,
                        color: getContrastingColor(accent),
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 12),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: comicInk,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (days != null)
                      RichText(
                        text: TextSpan(
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: comicInk,
                            fontWeight: FontWeight.w900,
                          ),
                          children: [
                            TextSpan(text: '$days'),
                            TextSpan(
                              text:
                                  AppLocalizations.of(
                                    context,
                                  )?.quitCardKeepDays(days) ??
                                  (days == 1 ? ' day' : ' days'),
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: comicInk,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      Text(
                        AppLocalizations.of(context)?.quitCardSubtitle ??
                            'Tap to start',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: comicInk,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    const Spacer(),
                    Row(
                      children: [
                        if (parsedQuitDate != null)
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: comicInk, width: 2),
                              ),
                              child: Text(
                                DateFormat.yMMMd(
                                  AppLocalizations.of(context)?.localeName,
                                ).format(parsedQuitDate),
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: comicInk,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        const Spacer(),
                        if (!editing)
                          const Icon(
                            Icons.arrow_forward_rounded,
                            color: comicInk,
                            size: 24,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (!editing) return card;

    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        card,
        if (onDelete != null)
          Positioned(
            top: 6,
            right: 6,
            child: GestureDetector(
              onTap: onDelete,
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: comicRed,
                  shape: BoxShape.circle,
                  border: Border.all(color: comicInk, width: 2.5),
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 20),
              ),
            ),
          ),
        if (onRename != null)
          Positioned(
            bottom: 10,
            right: 10,
            child: GestureDetector(
              onTap: onRename,
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: comicYellow,
                  shape: BoxShape.circle,
                  border: Border.all(color: comicInk, width: 2.5),
                ),
                child: const Icon(Icons.edit, color: comicInk, size: 18),
              ),
            ),
          ),
      ],
    );
  }
}
