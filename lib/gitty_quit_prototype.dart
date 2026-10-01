import 'package:flutter/material.dart';

import 'gitty_quit_daily_content.dart';

class GittyQuitPrototype extends StatefulWidget {
  const GittyQuitPrototype({super.key});

  @override
  State<GittyQuitPrototype> createState() => _GittyQuitPrototypeState();
}

class _GittyQuitPrototypeState extends State<GittyQuitPrototype> {
  static const _daysCompleted = 1;
  static const _daysInJourney = 90;
  static const _dailySavings = 8.50;
  static const _totalSavings = 8.50;
  static const _points = 35;

  bool _expanded = false;

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
      child: InkWell(
        onTap: () => setState(() => _expanded = !_expanded),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Gitty Quit',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: on,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    color: on,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Tag $_daysCompleted von $_daysInJourney · Level 1 — Startklar',
                style: theme.textTheme.bodyMedium?.copyWith(color: on),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: scheme.surface.withAlpha(140),
                  color: scheme.primary,
                ),
              ),
              const SizedBox(height: 12),
              _Row(label: 'Heute gespart', value: _euro(_dailySavings)),
              const SizedBox(height: 4),
              _Row(label: 'Insgesamt gespart', value: _euro(_totalSavings)),
              if (!_expanded) ...[
                const SizedBox(height: 8),
                Text(
                  'Tippen für Wissensimpuls und Tagesmission',
                  style: theme.textTheme.labelMedium?.copyWith(color: on),
                ),
              ],
              if (_expanded) ...[
                const SizedBox(height: 16),
                _Title(
                  icon: Icons.science_outlined,
                  label: content.title.toUpperCase(),
                ),
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
                const Divider(height: 28),
                const _Title(icon: Icons.favorite_outline, label: 'DEIN ANTRIEB'),
                const SizedBox(height: 8),
                Text(
                  '„${content.motivation}“',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: on,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
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
            ],
          ),
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
        Text(label, style: theme.textTheme.bodyMedium?.copyWith(color: on)),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
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
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: on,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }
}
