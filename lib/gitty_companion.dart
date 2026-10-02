import 'package:flutter/material.dart';
import 'package:quitter/comic_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Set to true after the four female images exist in assets/gitty/:
/// taube_w.png, ratte_w.png, fuchs_w.png, waschbaer_w.png
const bool kFemaleImagesReady = false;

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

  bool get female => id.endsWith('_w');
  String get baseId => female ? id.substring(0, id.length - 2) : id;
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
    name: 'Pjotre',
    story:
        'Raucht seit Jahren hinter den Mülltonnen und kennt jede Ausrede persönlich. Die letzte Kippe ist noch nicht ausgedrückt, aber er arbeitet dran.',
    asset: 'assets/gitty/fuchs.png',
  ),
  GittyCompanion(
    id: 'waschbaer',
    name: 'Rocco',
    story:
        'Sammelt, was andere wegwerfen, und leuchtet in die dunkelsten Ecken, bis wieder Licht da ist.',
    asset: 'assets/gitty/waschbaer.png',
  ),
  GittyCompanion(
    id: 'taube_w',
    name: 'Dolores',
    story:
        'Hat jahrelang auf Dächern aufgelegt, bis die Nachbarn die Polizei riefen. Den Takt hat sie wiedergefunden, die Lautstärke nie.',
    asset: kFemaleImagesReady
        ? 'assets/gitty/taube_w.png'
        : 'assets/gitty/taube.png',
  ),
  GittyCompanion(
    id: 'ratte_w',
    name: 'Gitta',
    story:
        'Wuchs zwischen Mülltonnen auf, hat jedes Schloss der Stadt geknackt und weiß: Hinter jeder Kette steckt nur ein Schloss.',
    asset: kFemaleImagesReady
        ? 'assets/gitty/ratte_w.png'
        : 'assets/gitty/ratte.png',
  ),
  GittyCompanion(
    id: 'fuchs_w',
    name: 'Pjotra',
    story:
        'Raucht seit Jahren hinter den Mülltonnen und führt Buch über jede Ausrede. Die Liste ist lang, der Aschenbecher voll.',
    asset: kFemaleImagesReady
        ? 'assets/gitty/fuchs_w.png'
        : 'assets/gitty/fuchs.png',
  ),
  GittyCompanion(
    id: 'waschbaer_w',
    name: 'Rosa',
    story:
        'Sammelt, was andere wegwerfen, und leuchtet mit ihrer Taschenlampe in die dunkelsten Ecken, bis wieder Licht da ist.',
    asset: kFemaleImagesReady
        ? 'assets/gitty/waschbaer_w.png'
        : 'assets/gitty/waschbaer.png',
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
  bool _female = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialId;
    _female = widget.initialId?.endsWith('_w') ?? false;
  }

  void _setFemale(bool female) {
    if (female == _female) return;
    setState(() {
      _female = female;
      final current = gittyCompanionById(_selected);
      if (current != null) {
        _selected = female ? '${current.baseId}_w' : current.baseId;
      }
    });
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
    final shown = gittyCompanions.where((c) => c.female == _female).toList();
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
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: _GenderButton(
                        label: 'Er',
                        selected: !_female,
                        onTap: () => _setFemale(false),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _GenderButton(
                        label: 'Sie',
                        selected: _female,
                        onTap: () => _setFemale(true),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.58,
                    children: [
                      for (var i = 0; i < shown.length; i++)
                        _CompanionCard(
                          companion: shown[i],
                          color: _palette[i % _palette.length],
                          selected: shown[i].id == _selected,
                          onTap: () => setState(() => _selected = shown[i].id),
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

class _GenderButton extends StatelessWidget {
  const _GenderButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? comicYellow : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: comicInk, width: 3),
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 48),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (selected) ...[
                  const Icon(Icons.check_rounded, color: comicInk, size: 22),
                  const SizedBox(width: 6),
                ],
                Text(
                  label,
                  style: const TextStyle(
                    color: comicInk,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
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
                  errorBuilder: (context, error, stack) => const Icon(
                    Icons.pets,
                    size: 56,
                    color: comicInk,
                  ),
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
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(color: comicInk),
          ),
        ],
      ),
    );
  }
}
