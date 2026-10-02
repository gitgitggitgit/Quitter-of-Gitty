import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitter/adderall_page.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/benzodiazepine_page.dart';
import 'package:quitter/comic_style.dart';
import 'package:quitter/gitty_icons.dart';
import 'package:quitter/maoi_page.dart';
import 'package:quitter/snri_page.dart';
import 'package:quitter/ssri_page.dart';
import 'package:quitter/tca_page.dart';
import 'package:quitter/cocaine_page.dart';
import 'package:quitter/gabapentinoids_page.dart';
import 'package:quitter/ghb_page.dart';
import 'package:quitter/inhalants_page.dart';
import 'package:quitter/ketamine_page.dart';
import 'package:quitter/kratom_page.dart';
import 'package:quitter/mdma_page.dart';
import 'package:quitter/steroids_page.dart';
import 'package:quitter/synthetic_cannabinoids_page.dart';
import 'package:quitter/edit_entry_page.dart';
import 'package:quitter/empty_state.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/marijuana_page.dart';
import 'package:quitter/meth_page.dart';
import 'package:quitter/nicotine_pouches.dart';
import 'package:quitter/nitrous_oxide_page.dart';
import 'package:quitter/opioid_page.dart';
import 'package:quitter/pornography_page.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/social_media_page.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/vaping_page.dart';
import 'package:quitter/smokeless_tobacco_page.dart';

class _AddictionOption {
  final String id;
  final String title;
  final IconData icon;
  final List<Color> gradientColors;
  final Widget destination;
  final List<String> aliases;

  const _AddictionOption({
    this.id = '',
    required this.title,
    required this.icon,
    required this.gradientColors,
    required this.destination,
    this.aliases = const [],
  });

  bool matches(String query) {
    if (query.isEmpty) return true;
    final q = query.toLowerCase();
    if (title.toLowerCase().contains(q)) return true;
    return aliases.any((a) => a.contains(q));
  }
}

class AddAddictionPage extends StatefulWidget {
  const AddAddictionPage({super.key, this.initialQuery = ''});

  final String initialQuery;

  @override
  State<AddAddictionPage> createState() => _AddAddictionPageState();
}

class _AddAddictionPageState extends State<AddAddictionPage> {
  late final TextEditingController _searchController;
  late String _query;

  @override
  void initState() {
    super.initState();
    _query = widget.initialQuery;
    _searchController = TextEditingController(text: widget.initialQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final addictions = context.watch<AddictionProvider>();

    final options = <_AddictionOption>[];

    if (addictions.quitAdderall == null) {
      options.add(
        _AddictionOption(
          id: 'adderall',
          title: l10n.addictionAdderall,
          icon: gittyIcon('adderall', Icons.lightbulb_outline),
          gradientColors: [const Color(0xFFFF8C42), const Color(0xFFFF6B35)],
          destination: const AdderallPage(started: false),
          aliases: const [
            'ritalin',
            'adhd',
            'stimulant',
            'amphetamine',
            'dexedrine',
            'vyvanse',
            'concerta',
          ],
        ),
      );
    }
    if (addictions.quitSsri == null) {
      options.add(
        _AddictionOption(
          id: 'ssri',
          title: l10n.addictionSsri,
          icon: gittyIcon('ssri', Icons.psychology),
          gradientColors: [const Color(0xFF7C3AED), const Color(0xFF4F46E5)],
          destination: const SsriPage(started: false),
          aliases: const [
            'antidepressant',
            'prozac',
            'zoloft',
            'lexapro',
            'celexa',
            'paxil',
            'fluoxetine',
            'sertraline',
            'escitalopram',
          ],
        ),
      );
    }
    if (addictions.quitSnri == null) {
      options.add(
        _AddictionOption(
          id: 'snri',
          title: l10n.addictionSnri,
          icon: gittyIcon('snri', Icons.psychology_alt),
          gradientColors: [const Color(0xFF6D28D9), const Color(0xFF7C3AED)],
          destination: const SnriPage(started: false),
          aliases: const [
            'antidepressant',
            'effexor',
            'cymbalta',
            'venlafaxine',
            'duloxetine',
            'pristiq',
          ],
        ),
      );
    }
    if (addictions.quitTca == null) {
      options.add(
        _AddictionOption(
          id: 'tca',
          title: l10n.addictionTca,
          icon: gittyIcon('tca', Icons.medication_liquid),
          gradientColors: [const Color(0xFF5B21B6), const Color(0xFF6D28D9)],
          destination: const TcaPage(started: false),
          aliases: const [
            'tricyclic',
            'antidepressant',
            'amitriptyline',
            'imipramine',
            'nortriptyline',
          ],
        ),
      );
    }
    if (addictions.quitMaoi == null) {
      options.add(
        _AddictionOption(
          id: 'maoi',
          title: l10n.addictionMaoi,
          icon: gittyIcon('maoi', Icons.science),
          gradientColors: [const Color(0xFF4C1D95), const Color(0xFF5B21B6)],
          destination: const MaoiPage(started: false),
          aliases: const [
            'monoamine',
            'antidepressant',
            'phenelzine',
            'selegiline',
            'tranylcypromine',
            'nardil',
          ],
        ),
      );
    }
    if (addictions.quitAlcohol == null) {
      options.add(
        _AddictionOption(
          id: 'alcohol',
          title: l10n.addictionAlcohol,
          icon: gittyIcon('alcohol', Icons.local_bar),
          gradientColors: [const Color(0xFF6366F1), const Color(0xFF8B5CF6)],
          destination: const AlcoholPage(started: false),
          aliases: const [
            'booze',
            'drinking',
            'beer',
            'wine',
            'spirits',
            'liquor',
            'whiskey',
            'vodka',
            'drunk',
          ],
        ),
      );
    }
    if (addictions.quitBenzos == null) {
      options.add(
        _AddictionOption(
          id: 'benzos',
          title: l10n.addictionBenzos,
          icon: gittyIcon('benzos', Icons.bedtime),
          gradientColors: [const Color(0xFF6D5DD3), const Color(0xFF1E1B4B)],
          destination: const BenzodiazepinePage(started: false),
          aliases: const [
            'xanax',
            'valium',
            'klonopin',
            'ativan',
            'diazepam',
            'alprazolam',
            'clonazepam',
            'lorazepam',
            'tranquilizer',
            'sleeping pill',
          ],
        ),
      );
    }
    if (addictions.quitCocaine == null) {
      options.add(
        _AddictionOption(
          id: 'cocaine',
          title: l10n.addictionCocaine,
          icon: gittyIcon('cocaine', Icons.bolt),
          gradientColors: [const Color(0xFF3B82F6), const Color(0xFF1D4ED8)],
          destination: const CocainePage(started: false),
          aliases: const [
            'coke',
            'blow',
            'snow',
            'crack',
            'powder',
            'nose candy',
          ],
        ),
      );
    }
    if (addictions.quitMarijuana == null) {
      options.add(
        _AddictionOption(
          id: 'marijuana',
          title: l10n.addictionMarijuana,
          icon: gittyIcon('marijuana', Icons.grass),
          gradientColors: [
            const Color.fromARGB(255, 132, 230, 128),
            const Color.fromARGB(255, 30, 87, 3),
          ],
          destination: const MarijuanaPage(started: false),
          aliases: const [
            'weed',
            'cannabis',
            'pot',
            'ganja',
            'reefer',
            'mary jane',
            'bud',
            'herb',
            'dope',
            'hash',
            'thc',
            'edibles',
            'joint',
            'blunt',
          ],
        ),
      );
    }
    if (addictions.quitNitrousOxide == null) {
      options.add(
        _AddictionOption(
          id: 'nitrous_oxide',
          title: l10n.addictionNitrousOxide,
          icon: gittyIcon('nitrous_oxide', Icons.air_outlined),
          gradientColors: [const Color(0xFF38BDF8), const Color(0xFF7DD3FC)],
          destination: const NitrousOxidePage(started: false),
          aliases: const [
            'laughing gas',
            'whippets',
            'nos',
            'nangs',
            'nitrous',
          ],
        ),
      );
    }
    if (addictions.quitMeth == null) {
      options.add(
        _AddictionOption(
          id: 'meth',
          title: l10n.addictionMeth,
          icon: gittyIcon('meth', Icons.battery_charging_full),
          gradientColors: [const Color(0xFF14B8A6), const Color(0xFF0D9488)],
          destination: const MethPage(started: false),
          aliases: const [
            'crystal',
            'ice',
            'speed',
            'crank',
            'tina',
            'methamphetamine',
            'tweak',
            'glass',
          ],
        ),
      );
    }
    if (addictions.quitPouches == null) {
      options.add(
        _AddictionOption(
          id: 'nicotine_pouches',
          title: l10n.addictionNicotinePouches,
          icon: gittyIcon('nicotine_pouches', Icons.scatter_plot),
          gradientColors: [const Color(0xFFF59E0B), const Color(0xFFEF4444)],
          destination: const NicotinePouchesPage(started: false),
          aliases: const ['zyn', 'on!', 'nicotine pouch', 'snus', 'nicotine'],
        ),
      );
    }
    if (addictions.quitHeroin == null) {
      options.add(
        _AddictionOption(
          id: 'heroin',
          title: l10n.addictionHeroin,
          icon: gittyIcon('heroin', Icons.medication),
          gradientColors: [const Color(0xFFEC4899), const Color(0xFFBE185D)],
          destination: const OpioidPage(started: false, storageKey: 'heroin'),
          aliases: const [
            'smack',
            'junk',
            'dope',
            'h',
            'horse',
            'black tar',
            'opioid',
            'opiate',
          ],
        ),
      );
    }
    if (addictions.quitOpioids == null) {
      options.add(
        _AddictionOption(
          id: 'opioids',
          title: l10n.addictionOpioids,
          icon: gittyIcon('opioids', Icons.medication),
          gradientColors: [const Color(0xFFEC4899), const Color(0xFFBE185D)],
          destination: const OpioidPage(started: false),
          aliases: const [
            'oxy',
            'oxycodone',
            'vicodin',
            'percocet',
            'hydrocodone',
            'painkiller',
            'opiate',
            'morphine',
            'codeine',
            'tramadol',
            'prescription',
          ],
        ),
      );
    }
    if (addictions.quitPornography == null) {
      options.add(
        _AddictionOption(
          id: 'pornography',
          title: l10n.addictionAdultContent,
          icon: gittyIcon('pornography', Icons.block),
          gradientColors: [const Color(0xFFF43F5E), const Color(0xFFE11D48)],
          destination: const PornographyPage(started: false),
          aliases: const [
            'porn',
            'pornography',
            'adult content',
            'xxx',
            'nofap',
            'adult',
          ],
        ),
      );
    }
    if (addictions.quitSmoking == null) {
      options.add(
        _AddictionOption(
          id: 'smoking',
          title: l10n.addictionSmoking,
          icon: gittyIcon('smoking', Icons.eco),
          gradientColors: [const Color(0xFF10B981), const Color(0xFF059669)],
          destination: const SmokingPage(started: false),
          aliases: const [
            'cigarette',
            'cigs',
            'tobacco',
            'smokes',
            'nicotine',
            'cigar',
            'pipe',
          ],
        ),
      );
    }
    if (addictions.quitSocialMedia == null) {
      options.add(
        _AddictionOption(
          id: 'social_media',
          title: l10n.addictionSocialMedia,
          icon: gittyIcon('social_media', Icons.public),
          gradientColors: [const Color(0xFF8B5CF6), const Color(0xFF7C3AED)],
          destination: const SocialMediaPage(started: false),
          aliases: const [
            'instagram',
            'twitter',
            'tiktok',
            'facebook',
            'reddit',
            'snapchat',
            'youtube',
            'phone',
            'scrolling',
            'x',
          ],
        ),
      );
    }
    if (addictions.quitVaping == null) {
      options.add(
        _AddictionOption(
          id: 'vaping',
          title: l10n.addictionVaping,
          icon: gittyIcon('vaping', Icons.air),
          gradientColors: [const Color(0xFF06B6D4), const Color(0xFF0EA5E9)],
          destination: const VapingPage(started: false),
          aliases: const [
            'juul',
            'e-cig',
            'ecig',
            'e cigarette',
            'nicotine',
            'pod',
            'puff bar',
            'vape',
          ],
        ),
      );
    }

    if (addictions.quitKratom == null) {
      options.add(
        _AddictionOption(
          id: 'kratom',
          title: l10n.addictionKratom,
          icon: gittyIcon('kratom', Icons.local_florist),
          gradientColors: [const Color(0xFF6D9F4E), const Color(0xFF3F6B2E)],
          destination: const KratomPage(started: false),
          aliases: const ['mitragyna', 'kava', 'herbal', 'leaf'],
        ),
      );
    }
    if (addictions.quitGabapentinoids == null) {
      options.add(
        _AddictionOption(
          id: 'gabapentinoids',
          title: l10n.addictionGabapentinoid,
          icon: gittyIcon('gabapentinoids', Icons.medication_outlined),
          gradientColors: [const Color(0xFF94A3B8), const Color(0xFF475569)],
          destination: const GabapentinoidPage(started: false),
          aliases: const [
            'gabapentin',
            'lyrica',
            'neurontin',
            'pregabalin',
            'nerve pain',
          ],
        ),
      );
    }
    if (addictions.quitGhb == null) {
      options.add(
        _AddictionOption(
          id: 'ghb',
          title: l10n.addictionGhb,
          icon: gittyIcon('ghb', Icons.water_drop),
          gradientColors: [const Color(0xFF60A5FA), const Color(0xFF1E3A8A)],
          destination: const GhbPage(started: false),
          aliases: const [
            'g',
            'liquid g',
            'liquid ecstasy',
            'date rape drug',
            'xyrem',
          ],
        ),
      );
    }
    if (addictions.quitKetamine == null) {
      options.add(
        _AddictionOption(
          id: 'ketamine',
          title: l10n.addictionKetamine,
          icon: gittyIcon('ketamine', Icons.vaccines),
          gradientColors: [const Color(0xFF818CF8), const Color(0xFF4338CA)],
          destination: const KetaminePage(started: false),
          aliases: const [
            'special k',
            'k',
            'ket',
            'horse tranquilizer',
            'dissociative',
          ],
        ),
      );
    }
    if (addictions.quitInhalants == null) {
      options.add(
        _AddictionOption(
          id: 'inhalants',
          title: l10n.addictionInhalants,
          icon: gittyIcon('inhalants', Icons.local_gas_station),
          gradientColors: [const Color(0xFF9CA3AF), const Color(0xFF4B5563)],
          destination: const InhalantsPage(started: false),
          aliases: const [
            'huffing',
            'glue',
            'paint',
            'solvent',
            'aerosol',
            'dusting',
            'whippets',
          ],
        ),
      );
    }
    if (addictions.quitSyntheticCannabinoids == null) {
      options.add(
        _AddictionOption(
          id: 'synthetic_cannabinoids',
          title: l10n.addictionSyntheticCannabinoids,
          icon: gittyIcon('synthetic_cannabinoids', Icons.whatshot),
          gradientColors: [const Color(0xFFA3E635), const Color(0xFF4D7C0F)],
          destination: const SyntheticCannabinoidsPage(started: false),
          aliases: const [
            'k2',
            'spice',
            'synthetic weed',
            'fake weed',
            'bath salts',
          ],
        ),
      );
    }
    if (addictions.quitMdma == null) {
      options.add(
        _AddictionOption(
          id: 'mdma',
          title: l10n.addictionMdma,
          icon: gittyIcon('mdma', Icons.favorite),
          gradientColors: [const Color(0xFFF472B6), const Color(0xFFA855F7)],
          destination: const MdmaPage(started: false),
          aliases: const [
            'ecstasy',
            'molly',
            'x',
            'e',
            'xtc',
            'rolls',
            'mandy',
          ],
        ),
      );
    }
    if (addictions.quitSteroids == null) {
      options.add(
        _AddictionOption(
          id: 'steroids',
          title: l10n.addictionSteroids,
          icon: gittyIcon('steroids', Icons.fitness_center),
          gradientColors: [const Color(0xFFEF4444), const Color(0xFF7F1D1D)],
          destination: const SteroidsPage(started: false),
          aliases: const [
            'roids',
            'gear',
            'juice',
            'testosterone',
            'anabolic',
            'aas',
            'peds',
          ],
        ),
      );
    }

    if (addictions.quitFentanyl == null) {
      options.add(
        _AddictionOption(
          id: 'fentanyl',
          title: l10n.addictionFentanyl,
          icon: gittyIcon('fentanyl', Icons.medication),
          gradientColors: [const Color(0xFF7C3AED), const Color(0xFF3B0764)],
          destination: const OpioidPage(started: false, storageKey: 'fentanyl'),
          aliases: const [
            'fent',
            'opioid',
            'opiate',
            'synthetic opioid',
            'carfentanil',
          ],
        ),
      );
    }

    if (addictions.quitSmokelessTobacco == null) {
      options.add(
        _AddictionOption(
          id: 'smokeless_tobacco',
          title: l10n.addictionSmokelessTobacco,
          icon: gittyIcon('smokeless_tobacco', Icons.grass),
          gradientColors: [const Color(0xFF78350F), const Color(0xFF451A03)],
          destination: const SmokelessTobaccoPage(started: false),
          aliases: const [
            'dip',
            'chew',
            'chewing tobacco',
            'snuff',
            'snus',
            'tobacco',
            'nicotine',
            'dipping',
          ],
        ),
      );
    }

    options.sort(
      (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
    );

    final filtered = options.where((o) => o.matches(_query)).toList();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.addAddictionTitle)),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: l10n.search,
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: _query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear_rounded),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _query = '');
                          },
                        )
                      : null,
                ),
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
            Expanded(
              child: filtered.isEmpty
                  ? AppEmptyState(
                      icon: options.isEmpty
                          ? Icons.check_circle_outline_rounded
                          : Icons.search_off_rounded,
                      title: options.isEmpty
                          ? l10n.addAddictionNoneAvailable
                          : l10n.noSearchResults,
                      message: l10n.addAddictionCustomSubtitle,
                      actionLabel: l10n.homeTrackAnyway,
                      actionIcon: Icons.add_rounded,
                      onAction: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const EditEntryPage(),
                        ),
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.only(top: 4, bottom: 24),
                      children: [
                        ...filtered.map(
                          (option) => _AddictionTile(
                            option: option,
                            onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => option.destination,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _ComicTile(
                          fill: comicYellow,
                          accent: comicRed,
                          shadow: Theme.of(context).brightness == Brightness.dark
                              ? comicYellow
                              : comicInk,
                          icon: Icons.add_rounded,
                          iconColor: Colors.white,
                          title: l10n.addAddictionCustom,
                          subtitle: l10n.addAddictionCustomSubtitle,
                          onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => const EditEntryPage(),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddictionTile extends StatelessWidget {
  final _AddictionOption option;
  final VoidCallback onTap;

  const _AddictionTile({required this.option, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final accent = option.gradientColors.last;
    final fill = Color.lerp(option.gradientColors.first, Colors.white, 0.72)!;
    final shadow = dark
        ? Color.lerp(option.gradientColors.first, Colors.white, 0.35)!
        : comicInk;
    return _ComicTile(
      fill: fill,
      accent: accent,
      shadow: shadow,
      icon: option.icon,
      iconColor: getContrastingColor(accent),
      title: option.title,
      subtitle: gittyTagline(option.id),
      onTap: onTap,
    );
  }
}

class _ComicTile extends StatelessWidget {
  const _ComicTile({
    required this.fill,
    required this.accent,
    required this.shadow,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
    this.subtitle,
  });

  final Color fill;
  final Color accent;
  final Color shadow;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 20, 12),
      child: Container(
        decoration: BoxDecoration(
          color: fill,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: comicInk, width: 3),
          boxShadow: [BoxShadow(color: shadow, offset: const Offset(4, 4))],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: accent,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: comicInk, width: 2.5),
                    ),
                    child: Icon(icon, color: iconColor, size: 28),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: comicInk,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        if (subtitle != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              subtitle!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: comicInk,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: comicInk,
                    size: 26,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
