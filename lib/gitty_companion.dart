import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GittyCompanion {
  const GittyCompanion({
    required this.id,
    required this.name,
    required this.story,
    required this.asset,
  });

  final String id;
  final String name;
  final String story;
  final String asset;
}

const gittyCompanions = [
  GittyCompanion(
    id: 'taube',
    name: 'Dieter',
    story:
        'Hat jahrelang auf Dächern aufgelegt und dabei den Takt verloren, aber nie den Überblick.',
    asset: 'assets/gitty/taube.png',
  ),
  GittyCompanion(
    id: 'ratte',
    name: 'Gitty',
    story:
        'Wuchs zwischen Mülltonnen auf und weiß, dass hinter jeder Kette nur ein Schloss steckt.',
    asset: 'assets/gitty/ratte.png',
  ),
  GittyCompanion(
    id: 'fuchs',
    name: 'Ferdinand',
    story:
        'Hat in dunklen Gassen mehr gesehen, als er je erzählen wird, und steckt sein Geld jetzt lieber weg.',
    asset: 'assets/gitty/fuchs.png',
  ),
  GittyCompanion(
    id: 'waschbaer',
    name: 'Rocco',
    story:
        'Sammelt, was andere wegwerfen, und leuchtet in die dunkelsten Ecken, bis wieder Licht da ist.',
    asset: 'assets/gitty/waschbaer.png',
  ),
];

GittyCompanion? gittyCompanionById(String? id) {
  for (final c in gittyCompanions) {
    if (c.id == id) return c;
  }
  return null;
}

class GittyCompanionPage extends StatefulWidget {
  const GittyCompanionPage({super.key, this.initialId, this.firstTime = false});

  final String? initialId;
  final bool firstTime;

  @override
  State<GittyCompanionPage> createState() => _GittyCompanionPageState();
}

class _GittyCompanionPageState extends State<GittyCompanionPage> {
  String? _selected;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialId;
  }

  Future<void> _confirm() async {
    final id = _selected;
    if (id == null) return;
    setState(() => _saving = true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('gitty_companion', id);
    if (!mounted) return;
    Navigator.of(context).pop(id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      canPop: !widget.firstTime,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  'Wer soll dich begleiten?',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Dein Begleiter spricht mit dir, feiert deine Erfolge und '
                  'taucht überall in der App auf. Du kannst ihn jederzeit wechseln.',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.6,
                    children: [
                      for (final c in gittyCompanions)
                        _CompanionCard(
                          companion: c,
                          selected: c.id == _selected,
                          onTap: () => setState(() => _selected = c.id),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _selected == null || _saving ? null : _confirm,
                    child: Text(
                      _selected == null ? 'Wähle einen Begleiter' : 'Weiter',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CompanionCard extends StatelessWidget {
  const _CompanionCard({
    required this.companion,
    required this.selected,
    required this.onTap,
  });

  final GittyCompanion companion;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: selected ? scheme.primaryContainer : scheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: selected ? scheme.primary : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    companion.asset,
                    cacheWidth: 400,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                companion.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                companion.story,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
