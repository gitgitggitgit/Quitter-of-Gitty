import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GittyCompanion {
  const GittyCompanion({
    required this.id,
    required this.name,
    required this.role,
    required this.description,
    required this.asset,
  });

  final String id;
  final String name;
  final String role;
  final String description;
  final String asset;
}

const gittyCompanions = [
  GittyCompanion(
    id: 'taube',
    name: 'Taube',
    role: 'Verpeilter DJ',
    description: 'Trocken, beobachtet alles und liefert dir die klaren Fakten.',
    asset: 'assets/gitty/taube.png',
  ),
  GittyCompanion(
    id: 'ratte',
    name: 'Ratte Gitty',
    role: 'Straßenschlau',
    description: 'Zäh, sarkastisch, kennt jeden Trick und knackt jede Kette.',
    asset: 'assets/gitty/ratte.png',
  ),
  GittyCompanion(
    id: 'fuchs',
    name: 'Fuchs',
    role: 'Geheimnisvoll',
    description: 'Ruhig, direkt und hat selbst schon alles gesehen.',
    asset: 'assets/gitty/fuchs.png',
  ),
  GittyCompanion(
    id: 'waschbaer',
    name: 'Waschbär',
    role: 'Chaotisch und gutmütig',
    description: 'Leuchtet dir den Weg und sammelt deine Erfolge.',
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
              Text(companion.role, style: theme.textTheme.labelMedium),
              const SizedBox(height: 4),
              Text(
                companion.description,
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
