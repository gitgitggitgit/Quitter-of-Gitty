import 'package:shared_preferences/shared_preferences.dart';

/// Version der Begleiter: männlich oder weiblich. Gilt für die ganze Gruppe.
enum CompanionGender { male, female }

const _genderKey = 'quitty_companion_gender';

const _names = <String, Map<CompanionGender, String>>{
  'gitty': {CompanionGender.male: 'Gitty', CompanionGender.female: 'Gitty'},
  'pjotre': {CompanionGender.male: 'Pjotre', CompanionGender.female: 'Mica'},
  'rocco': {CompanionGender.male: 'Rocco', CompanionGender.female: 'Rocca'},
  'dieter': {CompanionGender.male: 'Dieter', CompanionGender.female: 'Dieta'},
};

String companionDisplayName(String id, CompanionGender g) => _names[id]?[g] ?? id;

Future<CompanionGender> loadCompanionGender() async {
  final p = await SharedPreferences.getInstance();
  return p.getString(_genderKey) == 'female' ? CompanionGender.female : CompanionGender.male;
}

Future<void> saveCompanionGender(CompanionGender g) async {
  final p = await SharedPreferences.getInstance();
  await p.setString(_genderKey, g.name);
}
