import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/l10n/generated/app_localizations_de.dart';

class GittyAppLocalizationsDe extends AppLocalizationsDe {
  GittyAppLocalizationsDe() : super('de');

  @override
  String get homeAddButton => 'Sucht';

  @override
  String get quitMilestonesQuitDate => 'Startdatum';

  @override
  String get addictionAdultContent => 'Porn';
}

class GittyLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const GittyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'de';

  @override
  Future<AppLocalizations> load(Locale locale) =>
      SynchronousFuture<AppLocalizations>(GittyAppLocalizationsDe());

  @override
  bool shouldReload(GittyLocalizationsDelegate old) => false;
}
