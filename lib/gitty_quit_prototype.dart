import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/gitty_companion.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'gitty_quit_daily_content.dart';

class _Habit {
  const _Habit(this.key, this.title, this.start);

  final String key;
  final String title;
  final DateTime start;
}

class GittyQuitPrototype extends StatefulWidget {
  const GittyQuitPrototype({super.key});

  @override
  State<GittyQuitPrototype> createState() => _GittyQuitPrototypeState();
}

class _GittyQuitPrototypeState extends State<GittyQuitPrototype> {
  static const _prefix = 'gitty_cost_';
  static const _companionKey = 'gitty_companion';
  static const _milestones = [1, 3, 7, 14, 30, 60, 90, 180, 365];

  final Map<String, double> _costs = {};
  String? _selectedKey;
  String? _companionId;
  bool _pickerOpen = false;
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final loaded = <String, double>{};
    for (final k in prefs.getKeys()) {
      if (k.startsWith(_prefix)) {
        final v = prefs.getDouble(k);
        if (v != null) loaded[k.substring(_prefix.length)] = v;
      }
    }
    final companion = prefs.getString(_companionKey);
    if (!mounted) return;
    setState(() {
      _costs
        ..clear()
        ..addAll(loaded);
      _companionId = companion;
    });
    if (companion == null) _openPicker(first: true);
  }

  Future<void> _openPicker({required bool first}) async {
    if (_pickerOpen) return;
    _pickerOpen = true;
    final id = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) =>
            GittyCompanionPage(initialId: _companionId, firstTime: first),
      ),
    );
    _pickerOpen = false;
    if (id != null && mounted) setState(() => _companionId = id);
  }

  Future<void> _saveCost(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('$_prefix$key', value);
    if (!mounted) return;
    setState(() {
      _costs[key] = value;
    });
  }

  Future<void> _editCost(_Habit habit) async {
    final current = _costs[habit.key] ?? 0.0;
    final controller = TextEditingController(
      text: current == 0 ? '' : current.toStringAsFixed(2).replaceAll('.', ','),
    );
    final result = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Kosten pro Tag: ${habit.title}'),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Euro pro Tag',
            suffixText: '€',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            onPressed: () {
              final v = double.tryParse(
                controller.text.trim().replaceAll(',', '.'),
              );
              Navigator.pop(ctx, v);
            },
            child: const Text('Speichern'),
          ),
        ],
      ),
    );
    if (result != null && result >= 0) {
      await _saveCost(habit.key, result);
    }
  }

  List<_Habit> _habits(AddictionProvider a, AppLocalizations l) {
    final list = <_Habit>[];
    void add(String key, String title, String? date) {
      if (date == null) return;
      final start = DateTime.tryParse(date);
      if (start == null) return;
      list.add(_Habit(key, a.customNames[key] ?? title, start));
    }

    add('adderall', l.addictionAdderall, a.quitAdderall);
    add('ssri', l.addictionSsri, a.quitSsri);
    add('snri', l.addictionSnri, a.quitSnri);
    add('tca', l.addictionTca, a.quitTca);
    add('maoi', l.addictionMaoi, a.quitMaoi);
    add('nitrous_oxide', l.addictionNitrousOxide, a.quitNitrousOxide);
    add('kratom', l.addictionKratom, a.quitKratom);
    add('gabapentinoids', l.addictionGabapentinoid, a.quitGabapentinoids);
    add('ghb', l.addictionGhb, a.quitGhb);
    add('ketamine', l.addictionKetamine, a.quitKetamine);
    add('inhalants', l.addictionInhalants, a.quitInhalants);
    add(
      'synthetic_cannabinoids',
      l.addictionSyntheticCannabinoids,
      a.quitSyntheticCannabinoids,
    );
    add('mdma', l.addictionMdma, a.quitMdma);
    add('steroids', l.addictionSteroids, a.quitSteroids);
    add('alcohol', l.addictionAlcohol, a.quitAlcohol);
    add('benzos', l.addictionBenzos, a.quitBenzos);
    add('cocaine', l.addictionCocaine, a.quitCocaine);
    add('marijuana', l.addictionMarijuana, a.quitMarijuana);
    add('meth', l.addictionMeth, a.quitMeth);
    add('nicotine_pouches', l.addictionNicotinePouches, a.quitPouches);
    add('opioids', l.addictionOpioids, a.quitOpioids);
    add('heroin', l.addictionHeroin, a.quitHeroin);
    add('fentanyl', l.addictionFentanyl, a.quitFentanyl);
    add('pornography', l.addictionAdultContent, a.quitPornography);
    add('smoking', l.addictionSmoking, a.quitSmoking);
    add(
      'smokeless_tobacco',
      l.addictionSmokelessTobacco,
      a.quitSmokelessTobacco,
    );
    add('social_media', l.addictionSocialMedia, a.quitSocialMedia);
    add('vaping', l.addictionVaping, a.quitVaping);
    for (final e in a.entries) {
      list.add(_Habit(e.id, e.title, e.quitDate));
    }
    return list;
  }

  static String _euro(double value) =>
      '${value.toStringAsFixed(2).replaceAll('.', ',')} €';

  static String _level(int points) {
    if (points < 100) return 'Level 1 — Startklar';
    if (points < 300) return 'Level 2 — Standhaft';
    if (points < 700) return 'Level 3 — Klarer Kopf';
    if (points < 1500) return 'Level 4 — Freier Weg';
    return 'Level 5 — Gitty Quit Champion';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final on = scheme.onPrimaryContainer;
    final l10n = AppLocalizations.of(context)!;
    final companion = gittyCompanionById(_companionId);

    return Consumer<AddictionProvider>(
      builder: (context, addictions, child) {
        final habits = _habits(addictions, l10n);

        if (habits.isEmpty) {
          return Card(
            elevation: 0,
            color: scheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gitty Quit',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: on,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lege mit dem Plus-Button unten eine Gewohnheit an. '
                    'Dort wählst du auch dein Startdatum.',
                    style: theme.textTheme.bodyMedium?.copyWith(color: on),
                  ),
                ],
              ),
            ),
          );
        }

        final habit = habits.firstWhere(
          (h) => h.key == _selectedKey,
          orElse: () => habits.first,
        );
        final content = gittyQuitPrototypeContent;
        final elapsed = DateTime.now().difference(habit.start);
        final days = elapsed.isNegative ? 0 : elapsed.inDays;
        final dayNumber = days + 1;
        final cost = _costs[habit.key] ?? 0.0;
        final totalSaved =
            elapsed.isNegative ? 0.0 : elapsed.inMinutes / 1440 * cost;
        final points = days * 10;
        final progress = (dayNumber / 90).clamp(0.0, 1.0).toDouble();
        int? nextMilestone;
        for (final m in _milestones) {
          if (m > days) {
            nextMilestone = m;
            break;
          }
        }

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
                      if (companion != null) ...[
                        GestureDetector(
                          onTap: () => _openPicker(first: false),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: scheme.surface.withAlpha(140),
                            child: ClipOval(
                              child: Image.asset(
                                companion.asset,
                                width: 56,
                                height: 56,
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                                cacheWidth: 200,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gitty Quit',
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: on,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            if (companion != null)
                              Text(
                                '${companion.name} begleitet dich',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: on,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Icon(
                        _expanded ? Icons.expand_less : Icons.expand_more,
                        color: on,
                      ),
                    ],
                  ),
                  if (habits.length > 1) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        for (final h in habits)
                          ChoiceChip(
                            label: Text(h.title),
                            selected: h.key == habit.key,
                            onSelected: (_) =>
                                setState(() => _selectedKey = h.key),
                          ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 8),
                  Text(
                    '${habit.title} · Tag $dayNumber von 90 · ${_level(points)}',
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
                  if (cost == 0)
                    TextButton.icon(
                      onPressed: () => _editCost(habit),
                      icon: const Icon(Icons.euro),
                      label: const Text('Kosten pro Tag eingeben'),
                    )
                  else ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kosten pro Tag',
                          style:
                              theme.textTheme.bodyMedium?.copyWith(color: on),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _euro(cost),
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: on,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            IconButton(
                              visualDensity: VisualDensity.compact,
                              onPressed: () => _editCost(habit),
                              icon: Icon(Icons.edit, size: 18, color: on),
                            ),
                          ],
                        ),
                      ],
                    ),
                    _Row(label: 'Insgesamt gespart', value: _euro(totalSaved)),
                  ],
                  if (!_expanded) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Tippen für Wissensimpuls und Tagesmission',
                      style: theme.textTheme.labelMedium?.copyWith(color: on),
                    ),
                  ],
                  if (_expanded) ...[
                    const SizedBox(height: 16),
                    const _Title(
                      icon: Icons.science_outlined,
                      label: 'WISSENSIMPULS',
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
                    const _Title(
                      icon: Icons.favorite_outline,
                      label: 'DEIN ANTRIEB',
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '„${content.motivation}“',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: on,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const _Title(
                      icon: Icons.flag_outlined,
                      label: 'TAGESMISSION',
                    ),
                    const SizedBox(height: 8),
                    Text(
                      content.mission,
                      style: theme.textTheme.bodyLarge?.copyWith(color: on),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.stars_rounded, color: on),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Gitty-Punkte: $points\n'
                            '${nextMilestone == null ? 'Alle Meilensteine geschafft' : 'Nächster Erfolg: $nextMilestone Tage · noch ${nextMilestone - days} Tage'}',
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
      },
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
