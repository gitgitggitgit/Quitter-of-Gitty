import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const gittyMotivationKey = 'gitty_motivations';
const gittyMinReasons = 5;

const gittyCrisisHint =
    'Wenn es dir gerade nicht gut geht: Telefonseelsorge 0800 111 0 111 (kostenlos, rund um die Uhr) oder Notruf 112.';

const gittyStarterMotivations = <String>[
  'Ich will mein Leben nachhaltig verändern.',
  'Ich will einen gesunden Darm.',
  'Sober sein ist viel krasser als eine peinliche Abhängigkeit zu haben.',
  'Kein Bock, andere durch Stimmungsschwankungen und Reizbarkeit zu verletzen.',
  'Ich will nicht in Momenten konsumieren, in denen ich weiß, dass es mir schadet, zum Beispiel mit einer Mandelentzündung.',
  'Ich hasse es, wie ich mich am Tag nach Koks fühle: schwach und mutlos.',
  'Ich will ein besseres Gedächtnis haben.',
  'Ich will Geld sparen.',
  'Ich will meine normale Libido spüren.',
  'Ich will nicht verrückt werden durch Konsum.',
  'Rheuma vorbeugen.',
  'Ich will nicht dafür gemocht werden, dass man mit mir immer saufen kann.',
  'Ich will gesund aussehen und nicht verbraucht wirken. Auf jedem Hochzeitsfoto sehe ich fertig aus, während ich in dem Moment denke, ich wäre der Heißeste im Raum.',
  'Ich will mein Leben nicht verschwenden.',
  'Ich will nicht weiter in die von Oligarchen gewollte Verdummung rutschen.',
  'Ich will mich nicht umbringen.',
  'Klaren Kopf fürs Business.',
  'Führerschein nicht verlieren.',
  'Fit fürs Boxen werden.',
];

bool gittyIsCrisisReason(String reason) {
  final r = reason.toLowerCase();
  return r.contains('umbring') ||
      r.contains('suizid') ||
      r.contains('selbstmord') ||
      r.contains('nicht mehr leben');
}

int _stableHash(String s) {
  var h = 17;
  for (final c in s.codeUnits) {
    h = (h * 31 + c) & 0x7fffffff;
  }
  return h;
}

String? gittyMotivationFor(
  List<String> reasons,
  String habitKey,
  int dayNumber,
) {
  if (reasons.isEmpty || dayNumber < 2) return null;
  final h = _stableHash('$habitKey#$dayNumber');
  if (h % 5 >= 2) return null;
  return reasons[(h ~/ 5) % reasons.length];
}

String? gittyMotivationIntro(String companionId, String reason) {
  if (gittyIsCrisisReason(reason)) return null;
  switch (companionId) {
    case 'taube':
      return 'Du hast mir mal verraten:';
    case 'ratte':
      return 'Vergiss nicht, warum wir das machen:';
    case 'fuchs':
      return 'Ich vergesse nie, was du gesagt hast:';
    case 'waschbaer':
      return 'Ich habe mir deinen Grund aufgehoben:';
  }
  return null;
}

class GittyMotivationPage extends StatefulWidget {
  const GittyMotivationPage({super.key, this.mandatory = false});

  final bool mandatory;

  @override
  State<GittyMotivationPage> createState() => _GittyMotivationPageState();
}

class _GittyMotivationPageState extends State<GittyMotivationPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> _mine = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList(gittyMotivationKey) ?? [];
    if (!mounted) return;
    setState(() => _mine = List<String>.from(stored));
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(gittyMotivationKey, _mine);
  }

  Future<void> _add(String text) async {
    final value = text.trim();
    if (value.isEmpty || _mine.contains(value)) return;
    setState(() => _mine = [..._mine, value]);
    _controller.clear();
    await _persist();
  }

  Future<void> _remove(String value) async {
    setState(() => _mine = _mine.where((e) => e != value).toList());
    await _persist();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final enough = _mine.length >= gittyMinReasons;
    final suggestions =
        gittyStarterMotivations.where((s) => !_mine.contains(s)).toList();

    return PopScope(
      canPop: !widget.mandatory || enough,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meine Gründe'),
          automaticallyImplyLeading: !widget.mandatory || enough,
        ),
        bottomNavigationBar: widget.mandatory
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: FilledButton(
                    onPressed: enough ? () => Navigator.of(context).pop() : null,
                    child: Text(
                      enough
                          ? 'Weiter'
                          : 'Noch ${gittyMinReasons - _mine.length} Gründe nötig',
                    ),
                  ),
                ),
              )
            : null,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Wähle mindestens $gittyMinReasons Gründe aus oder schreib eigene. Dein Begleiter erinnert dich an manchen Tagen daran. Sie bleiben nur auf diesem Gerät.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              minLines: 1,
              maxLines: 4,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: _add,
              decoration: InputDecoration(
                labelText: 'Eigenen Grund eintragen',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _add(_controller.text),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'DEINE GRÜNDE (${_mine.length}/$gittyMinReasons)',
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            if (_mine.isEmpty)
              Text(
                'Noch keine. Tippe unten auf einen Vorschlag oder schreibe deinen eigenen.',
                style: theme.textTheme.bodyMedium,
              ),
            for (final m in _mine)
              Card(
                elevation: 0,
                color: theme.colorScheme.primaryContainer,
                child: ListTile(
                  title: Text(m),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _remove(m),
                  ),
                ),
              ),
            const SizedBox(height: 24),
            Text(
              'VORSCHLÄGE',
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),
            for (final s in suggestions)
              Card(
                elevation: 0,
                color: theme.colorScheme.surfaceContainerHigh,
                child: ListTile(
                  title: Text(s),
                  trailing: const Icon(Icons.add_circle_outline),
                  onTap: () => _add(s),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
