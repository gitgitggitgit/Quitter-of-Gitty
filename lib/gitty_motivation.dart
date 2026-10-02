import 'package:flutter/material.dart';
import 'package:quitter/comic_style.dart';
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
  final base = companionId.endsWith('_w')
      ? companionId.substring(0, companionId.length - 2)
      : companionId;
  switch (base) {
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

  static const _suggestionColors = [comicYellow, comicBlue, comicPink];

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

  OutlineInputBorder _inkBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: comicInk, width: 3),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final enough = _mine.length >= gittyMinReasons;
    final suggestions =
        gittyStarterMotivations.where((s) => !_mine.contains(s)).toList();
    const inkText = TextStyle(
      color: comicInk,
      fontWeight: FontWeight.w600,
      fontSize: 15,
    );
    final headline = theme.textTheme.labelLarge?.copyWith(
      color: comicInk,
      fontWeight: FontWeight.w900,
      letterSpacing: 0.8,
    );

    return PopScope(
      canPop: !widget.mandatory || enough,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Meine Gründe',
            style: TextStyle(color: comicInk, fontWeight: FontWeight.w900),
          ),
          backgroundColor: comicYellow,
          foregroundColor: comicInk,
          automaticallyImplyLeading: !widget.mandatory || enough,
          shape: const Border(
            bottom: BorderSide(color: comicInk, width: 3),
          ),
        ),
        bottomNavigationBar: widget.mandatory
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: FilledButton(
                    onPressed: enough ? () => Navigator.of(context).pop() : null,
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF3FBF7F),
                      foregroundColor: comicInk,
                      disabledBackgroundColor: Colors.white,
                      disabledForegroundColor: comicInk,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: const BorderSide(color: comicInk, width: 3),
                      ),
                    ),
                    child: Text(
                      enough
                          ? 'Weiter'
                          : 'Noch ${gittyMinReasons - _mine.length} Gründe nötig',
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              )
            : null,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ComicBubble(
              child: Text(
                'Wähle mindestens $gittyMinReasons Gründe aus oder schreib eigene. Dein Begleiter erinnert dich an manchen Tagen daran. Sie bleiben nur auf diesem Gerät.',
                style: inkText,
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: _controller,
              minLines: 1,
              maxLines: 4,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: _add,
              style: inkText,
              decoration: InputDecoration(
                labelText: 'Eigenen Grund eintragen',
                labelStyle: const TextStyle(
                  color: comicInk,
                  fontWeight: FontWeight.w700,
                ),
                filled: true,
                fillColor: Colors.white,
                border: _inkBorder(),
                enabledBorder: _inkBorder(),
                focusedBorder: _inkBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add_circle, color: comicRed),
                  onPressed: () => _add(_controller.text),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'DEINE GRÜNDE (${_mine.length}/$gittyMinReasons)',
              style: headline,
            ),
            const SizedBox(height: 10),
            if (_mine.isEmpty)
              Text(
                'Noch keine. Tippe unten auf einen Vorschlag oder schreibe deinen eigenen.',
                style: inkText,
              ),
            for (final m in _mine)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ComicPanel(
                  color: comicMint,
                  padding: const EdgeInsets.fromLTRB(16, 12, 4, 12),
                  child: Row(
                    children: [
                      Expanded(child: Text(m, style: inkText)),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: comicInk),
                        onPressed: () => _remove(m),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 24),
            Text('VORSCHLÄGE', style: headline),
            const SizedBox(height: 10),
            for (var i = 0; i < suggestions.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ComicPanel(
                  color: _suggestionColors[i % _suggestionColors.length],
                  shadowColor: comicInk,
                  padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
                  onTap: () => _add(suggestions[i]),
                  child: Row(
                    children: [
                      Expanded(child: Text(suggestions[i], style: inkText)),
                      const SizedBox(width: 8),
                      const Icon(Icons.add_circle_outline, color: comicInk),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
