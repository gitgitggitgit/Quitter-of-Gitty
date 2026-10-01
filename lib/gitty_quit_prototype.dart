import 'package:flutter/material.dart';

import 'gitty_quit_daily_content.dart';

class GittyQuitPrototype extends StatelessWidget {
  const GittyQuitPrototype({super.key});

  static const _daysCompleted = 1;
  static const _daysInJourney = 90;
  static const _dailySavings = 8.50;
  static const _totalSavings = 8.50;
  static const _points = 35;

  static String _euro(double value) =>
      '${value.toStringAsFixed(2).replaceAll('.', ',')} €';

  @override
  Widget build(BuildContext context) {
    final content = gittyQuitPrototypeContent;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final on = scheme.onPrimaryContainer;
    final progress = _daysCompleted / _daysInJourney;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: scheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gitty Quit',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: on,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Tag $_daysCompleted von $_daysInJourney · Level 1 — Startklar',
              style: theme.textTheme.bodyLarge?.copyWith(color: on),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10,
                backgroundColor: scheme.surface.withAlpha(140),
                color: scheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${(progress * 100).round()} % deiner ersten 90 Tage',
              style: theme.textTheme.labelLarge?.copyWith(color: on),
            ),
            const SizedBox(height: 20),
            _Row(label: 'Heute gespart', value: _euro(_dailySavings)),
            const SizedBox(height: 8),
            _Row(label: 'Insgesamt gespart', value: _euro(_totalSavings)),
            const SizedBox(height: 20),
            _Title(icon: Icons.science_outlined, label: content.title.toUpperCase()),
            const SizedBox(height: 8),
            Text(
              content.fact,
              style: theme.textTheme.titleMedium?.copyWith(
                color: on,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              content.explanation,
              style: theme.textTheme.bodyMedium?.copyWith(color: on),
            ),
            const SizedBox(height: 8),
            Text(
              content.source,
              style: theme.textTheme.labelMedium?.copyWith(color: on),
            ),
            const Divider(height: 32),
            const _Title(icon: Icons.favorite_outline, label: 'DEIN ANTRIEB'),
            const SizedBox(height: 8),
            Text(
              '„${content.motivation}“',
              style: theme.textTheme.titleMedium?.copyWith(
                color: on,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            const _Title(icon: Icons.flag_outlined, label: 'TAGESMISSION'),
            const SizedBox(height: 8),
            Text(
              content.mission,
              style: theme.textTheme.bodyLarge?.copyWith(color: on),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: scheme.surface.withAlpha(150),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '+20 Gitty-Punkte nach Abschluss',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: on,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.stars_rounded, color: on),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Gitty-Punkte: $_points\n'
                    'Nächster Erfolg: Eine Woche stark · noch 6 Tage',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: on,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final on = theme.colorScheme.onPrimaryContainer;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: theme.textTheme.bodyLarge?.copyWith(color: on)),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            color: on,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final on = theme.colorScheme.onPrimaryContainer;
    return Row(
      children: [
        Icon(icon, size: 18, color: on),
        const SizedBox(width: 8),
        Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(
            color: on,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
