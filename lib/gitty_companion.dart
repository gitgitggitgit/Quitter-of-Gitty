import 'package:flutter/material.dart';
import 'package:quitter/comic_style.dart';
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
  static const _palette = [comicPink, comicMint, comicYellow, comicBlue];

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
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
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
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.58,
                    children: [
                      for (var i = 0; i < gittyCompanions.length; i++)
                        _CompanionCard(
                          companion: gittyCompanions[i],
                          color: _palette[i % _palette.length],
                          selected: gittyCompanions[i].id == _selected,
                          onTap: () => setState(
                            () => _selected = gittyCompanions[i].id,
                          ),
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
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final GittyCompanion companion;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ComicPanel(
      color: color,
      shadowColor: selected ? comicRed : const Color(0xFF3A3A46),
      padding: const EdgeInsets.all(10),
      onTap: onTap,
      splat: selected,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  companion.asset,
                  cacheWidth: 400,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            companion.name,
            style: theme.textTheme.titleMedium?.copyWith(
              color: comicInk,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            companion.story,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(color: comicInk),
          ),
        ],
      ),
    );
  }
}
