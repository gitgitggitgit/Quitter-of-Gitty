import 'package:flutter/material.dart';
import 'package:quitter/comic_style.dart';
import 'package:quitter/quitty/companion_mood.dart';
import 'package:quitter/quitty/companion_stories.dart';
import 'package:quitter/quitty/companion_voice.dart';
import 'package:quitter/quitty/intro_audio.dart';
import 'package:quitter/quitty/sos_screen.dart';

/// SOS-Knopf, Begrüßung beim Start und Geschichten mit Vorlesen.
/// Einbau (z. B. im aufgeklappten Bereich von gitty_quit_prototype.dart):
///   if (companion != null)
///     CompanionExtras(
///       companionId: companion.id,
///       habitKey: habit.key,
///       dayNumber: dayNumber,
///     ),
class CompanionExtras extends StatefulWidget {
  const CompanionExtras({
    super.key,
    required this.companionId,
    required this.habitKey,
    required this.dayNumber,
  });

  final String companionId;
  final String habitKey;
  final int dayNumber;

  @override
  State<CompanionExtras> createState() => _CompanionExtrasState();
}

class _CompanionExtrasState extends State<CompanionExtras> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final key = companionStoryKey(widget.companionId);
      if (key == null || widget.dayNumber > 2) return;
      IntroAudio.playOnce(
        habitKey: widget.habitKey,
        companionId: key,
        gender: companionGenderOf(widget.companionId),
      );
    });
  }

  @override
  void dispose() {
    CompanionVoice.instance.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final key = companionStoryKey(widget.companionId);
    if (key == null) return const SizedBox.shrink();
    final gender = companionGenderOf(widget.companionId);
    final chapters = chaptersFor(key, gender, widget.dayNumber).reversed.toList();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: comicRed,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SosScreen(companionId: key, gender: gender),
              ),
            ),
            icon: const Icon(Icons.sos_rounded),
            label: const Text(
              'Ich brauche Hilfe, Drang!',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
        if (chapters.isNotEmpty) ...[
          const Divider(height: 28, color: comicInk, thickness: 2),
          Row(
            children: [
              const Icon(Icons.menu_book_outlined, size: 18, color: comicInk),
              const SizedBox(width: 8),
              Text(
                'DEINE GESCHICHTE',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: comicInk,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Theme(
            data: theme.copyWith(dividerColor: Colors.transparent),
            child: Column(
              children: [
                for (var i = 0; i < chapters.length; i++)
                  ExpansionTile(
                    key: PageStorageKey('story_${key}_${chapters[i].day}'),
                    initiallyExpanded: i == 0,
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    iconColor: comicInk,
                    collapsedIconColor: comicInk,
                    title: Text(
                      'Tag ${chapters[i].day}: ${chapters[i].title}',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: comicInk,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          chapters[i].text,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: comicInk,
                            height: 1.4,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SpeakButton(
                          text: '${chapters[i].title}. ${chapters[i].text}',
                          companionId: key,
                          gender: gender,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
