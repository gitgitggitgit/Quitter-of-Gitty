import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/comic_style.dart';
import 'package:quitter/gitty_companion.dart';
import 'package:quitter/gitty_days.dart';
import 'package:quitter/gitty_motivation.dart';
import 'package:quitter/gitty_voice.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<String> _reasons = [];
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
    final reasons = prefs.getStringList(gittyMotivationKey) ?? [];
    if (!mounted) return;
    setState(() {
      _costs
        ..clear()
        ..addAll(loaded);
      _companionId = companion;
      _reasons = List<String>.from(reasons);
    });
    if (companion == null) {
      _openPicker(first: true);
    } else if (reasons.length < gittyMinReasons) {
      _openMotivations(mandatory: true);
    }
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
    if (id != null && mounted && _reasons.length < gittyMinReasons) {
      await _openMotivations(mandatory: true);
    }
  }

  Future<void> _openMotivations({bool mandatory = false}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => GittyMotivationPage(mandatory: mandatory),
      ),
    );
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _reasons = List<String>.from(
        prefs.getStringList(gittyMotivationKey) ?? [],
      );
    });
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
    const on = comicInk;
    final l10n = AppLocalizations.of(context)!;
    final companion = gittyCompanionById(_companionId);

    return Consumer<AddictionProvider>(
      builder: (context, addictions, child) {
        final habits = _habits(addictions, l10n);

        if (habits.isEmpty) {
          return ComicPanel(
            color: comicMint,
            splat: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gitty Quit',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: on,
                    fontWeight: FontWeight.w900,
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
          );
        }

        final habit = habits.firstWhere(
          (h) => h.key == _selectedKey,
          orElse: () => habits.first,
        );
        final elapsed = DateTime.now().difference(habit.start);
        final days = elapsed.isNegative ? 0 : elapsed.inDays;
        final dayNumber = days + 1;
        final dayContent = gittyDayAll(habit.key, dayNumber);
        final motivation = gittyMotivationFor(_reasons, habit.key, dayNumber);
        final intro = motivation == null || companion == null
            ? null
            : gittyMotivationIntro(companion.id, motivation);
        final crisis = motivation != null && gittyIsCrisisReason(motivation);
        final cost = _costs[habit.key] ?? 0.0;
        final totalSaved =
            elapsed.isNegative ? 0.0 : elapsed.inMinutes / 1440 * cost;
        final points = days * 10;
        final progress = (dayNumber / 90).clamp(0.0, 1.0).toDouble();
        final needMore = _reasons.length < gittyMinReasons;
        final reasonsLabel =
            'Mindestens $gittyMinReasons Gründe wählen (${_reasons.length}/$gittyMinReasons)';
        final inkButton = TextButton.styleFrom(foregroundColor: comicInk);
        int? nextMilestone;
        for (final m in _milestones) {
          if (m > days) {
            nextMilestone = m;
            break;
          }
        }

        return ComicPanel(
          color: comicMint,
          splat: true,
          onTap: () => setState(() => _expanded = !_expanded),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (companion != null) ...[
                    GestureDetector(
                      onTap: () => _openPicker(first: false),
                      child: Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: comicInk, width: 3),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            companion.asset,
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
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        if (companion != null)
                          Text(
                            '${companion.name} begleitet dich',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: on,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 28),
                ],
              ),
              if (companion != null)
                ComicBubble(
                  child: Text(
                    gittyVoiceLine(
                      companionId: companion.id,
                      dayNumber: dayNumber,
                      saved: cost == 0 ? '' : _euro(totalSaved),
                    ),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: on,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              if (habits.length > 1) ...[
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final h in habits)
                      ChoiceChip(
                        label: Text(h.title),
                        selected: h.key == habit.key,
                        selectedColor: comicYellow,
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: comicInk, width: 2),
                        labelStyle: const TextStyle(
                          color: comicInk,
                          fontWeight: FontWeight.w800,
                        ),
                        onSelected: (_) =>
                            setState(() => _selectedKey = h.key),
                      ),
                  ],
                ),
              ],
              const SizedBox(height: 10),
              Text(
                '${habit.title} · Tag $dayNumber von 90 · ${_level(points)}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: on,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: comicInk, width: 2.5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 12,
                    backgroundColor: Colors.white,
                    color: comicRed,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (cost == 0)
                TextButton.icon(
                  style: inkButton,
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
                      style: theme.textTheme.bodyMedium?.copyWith(color: on),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _euro(cost),
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: on,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          onPressed: () => _editCost(habit),
                          icon: const Icon(Icons.edit, size: 18, color: on),
                        ),
                      ],
                    ),
                  ],
                ),
                _Row(label: 'Insgesamt gespart', value: _euro(totalSaved)),
              ],
              if (needMore)
                TextButton.icon(
                  style: inkButton,
                  onPressed: () => _openMotivations(),
                  icon: const Icon(Icons.favorite_outline),
                  label: Text(reasonsLabel),
                ),
              if (!_expanded) ...[
                const SizedBox(height: 8),
                Text(
                  motivation != null
                      ? 'Tippen für deinen Grund und die Tagesmission'
                      : 'Tippen für Wissensimpuls und Tagesmission',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: on,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
              if (_expanded) ...[
                const SizedBox(height: 16),
                if (motivation != null) ...[
                  const _Title(icon: Icons.favorite_outline, label: 'DEIN GRUND'),
                  const SizedBox(height: 8),
                  if (intro != null) ...[
                    Text(
                      intro,
                      style: theme.textTheme.labelLarge?.copyWith(color: on),
                    ),
                    const SizedBox(height: 4),
                  ],
                  Text(
                    '„$motivation“',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: on,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  if (crisis) ...[
                    const SizedBox(height: 8),
                    Text(
                      gittyCrisisHint,
                      style: theme.textTheme.bodyMedium?.copyWith(color: on),
                    ),
                  ],
                ] else if (dayContent != null) ...[
                  const _Title(
                    icon: Icons.science_outlined,
                    label: 'WISSENSIMPULS',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    dayContent.fact,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: on,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    dayContent.explanation,
                    style: theme.textTheme.bodyMedium?.copyWith(color: on),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    dayContent.source,
                    style: theme.textTheme.labelMedium?.copyWith(color: on),
                  ),
                ] else
                  Text(
                    'Für diese Gewohnheit oder diesen Tag folgen die Inhalte in der nächsten Etappe.',
                    style: theme.textTheme.bodyMedium?.copyWith(color: on),
                  ),
                if (dayContent != null) ...[
                  const Divider(height: 28, color: comicInk, thickness: 2),
                  const _Title(icon: Icons.flag_outlined, label: 'TAGESMISSION'),
                  const SizedBox(height: 8),
                  Text(
                    dayContent.mission,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: on,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                TextButton.icon(
                  style: inkButton,
                  onPressed: () => _openMotivations(),
                  icon: const Icon(Icons.edit_note),
                  label: Text(needMore ? reasonsLabel : 'Meine Gründe bearbeiten'),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.stars_rounded, color: on),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Gitty-Punkte: $points\n'
                        '${nextMilestone == null ? 'Alle Meilensteine geschafft' : 'Nächster Erfolg: $nextMilestone Tage · noch ${nextMilestone - days} Tage'}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: on,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(color: comicInk),
        ),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            color: comicInk,
            fontWeight: FontWeight.w900,
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
    return Row(
      children: [
        Icon(icon, size: 18, color: comicInk),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: comicInk,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }
}
