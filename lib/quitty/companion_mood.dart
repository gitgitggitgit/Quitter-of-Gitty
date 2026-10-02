import 'package:quitter/gitty_companion.dart';

/// Geschlecht der Version. Wird aus der Begleiter-ID abgeleitet (Suffix _w = weiblich).
enum CompanionGender { male, female }

/// App-ID (ohne _w) zu Geschichten-Schlüssel und zurück.
const _storyKeys = <String, String>{
  'taube': 'dieter',
  'ratte': 'gitty',
  'fuchs': 'pjotre',
  'waschbaer': 'rocco',
};
const _baseIds = <String, String>{
  'dieter': 'taube',
  'gitty': 'ratte',
  'pjotre': 'fuchs',
  'rocco': 'waschbaer',
};

CompanionGender companionGenderOf(String? companionId) =>
    (companionId?.endsWith('_w') ?? false) ? CompanionGender.female : CompanionGender.male;

/// Liefert 'gitty', 'pjotre', 'rocco' oder 'dieter' für eine App-Begleiter-ID.
String? companionStoryKey(String? companionId) {
  if (companionId == null) return null;
  final base = companionId.endsWith('_w')
      ? companionId.substring(0, companionId.length - 2)
      : companionId;
  return _storyKeys[base];
}

/// Name wie in gitty_companion.dart (z. B. Gitty/Gitta, Dieter/Dolores).
String companionDisplayName(String storyKey, CompanionGender g) {
  final base = _baseIds[storyKey];
  if (base == null) return storyKey;
  final c = gittyCompanionById(g == CompanionGender.female ? '${base}_w' : base);
  return c?.name ?? storyKey;
}
