import 'package:flutter/material.dart';
import 'package:quitter/quitty/companion_mood.dart';
import 'package:quitter/quitty/companion_voice.dart';
import 'package:quitter/quitty/moment_scripts.dart';

/// SOS-Bildschirm bei Drang: Atemkreis (4 Sek. ein, 6 Sek. aus) mit Stimme der Figur.
/// Aufruf: Navigator.push(context, MaterialPageRoute(builder: (_) =>
///   SosScreen(companionId: 'gitty', gender: gender)));
class SosScreen extends StatefulWidget {
  const SosScreen({super.key, required this.companionId, required this.gender, this.cycles = 6});
  final String companionId;
  final CompanionGender gender;
  final int cycles;

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> with SingleTickerProviderStateMixin {
  static const ink = Color(0xFF1A1A1A);
  static const inSeconds = 4;
  static const outSeconds = 6;

  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(seconds: inSeconds + outSeconds),
  );
  int _cycle = 0;
  bool _voiceOn = true;
  bool _running = false;
  bool _done = false;

  late final Animation<double> _scale = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween(begin: 0.45, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)),
      weight: inSeconds.toDouble(),
    ),
    TweenSequenceItem(
      tween: Tween(begin: 1.0, end: 0.45).chain(CurveTween(curve: Curves.easeInOut)),
      weight: outSeconds.toDouble(),
    ),
  ]).animate(_c);

  @override
  void initState() {
    super.initState();
    _c.addStatusListener((s) {
      if (s == AnimationStatus.completed) {
        _cycle++;
        if (_cycle >= widget.cycles) {
          setState(() {
            _running = false;
            _done = true;
          });
        } else {
          _c.forward(from: 0);
        }
      }
    });
  }

  @override
  void dispose() {
    CompanionVoice.instance.stop();
    _c.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    setState(() {
      _running = true;
      _done = false;
      _cycle = 0;
    });
    if (_voiceOn) {
      await speakMoment(widget.companionId, widget.gender, VoiceMoment.craving);
    }
    if (mounted && _running) _c.forward(from: 0);
  }

  void _stop() {
    CompanionVoice.instance.stop();
    _c.stop();
    setState(() => _running = false);
  }

  String get _phase {
    if (_done) return 'Geschafft';
    if (!_running) return 'Bereit?';
    return _c.value < inSeconds / (inSeconds + outSeconds) ? 'Einatmen' : 'Ausatmen';
  }

  @override
  Widget build(BuildContext context) {
    final name = companionDisplayName(widget.companionId, widget.gender);
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ink,
        title: const Text('Drang? Ich bin da.', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          IconButton(
            tooltip: _voiceOn ? 'Stimme aus' : 'Stimme an',
            icon: Icon(_voiceOn ? Icons.volume_up : Icons.volume_off),
            onPressed: () {
              setState(() => _voiceOn = !_voiceOn);
              if (!_voiceOn) CompanionVoice.instance.stop();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: AnimatedBuilder(
                    animation: _c,
                    builder: (context, _) {
                      final s = _running ? _scale.value : (_done ? 1.0 : 0.45);
                      return Container(
                        width: 260 * s,
                        height: 260 * s,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFFFD166),
                          border: Border.all(color: ink, width: 3),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _phase,
                          style: const TextStyle(color: ink, fontSize: 22, fontWeight: FontWeight.w800),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Text(
                _done
                    ? 'Der Drang wird leiser. $name ist stolz auf dich.'
                    : _running
                        ? 'Runde ${_cycle + 1} von ${widget.cycles}'
                        : 'Tippe auf Start. $name atmet mit dir.',
                textAlign: TextAlign.center,
                style: const TextStyle(color: ink, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: ink,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _running ? _stop : _start,
                  child: Text(_running ? 'Stopp' : (_done ? 'Nochmal' : 'Start')),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: ink, width: 2),
                ),
                child: const Text(
                  'Wenn es dir sehr schlecht geht: Die Telefonseelsorge ist kostenlos und rund um die Uhr '
                  'erreichbar (Deutschland: 0800 111 0 111). Bei Notfällen wähle 112.',
                  style: TextStyle(color: ink, fontSize: 13, height: 1.35),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
