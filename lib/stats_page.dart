import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quitter/add_addiction_page.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/comic_style.dart';
import 'package:quitter/empty_state.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _peach = Color(0xFFFFD9B0);

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final Map<String, double> _costs = {};
  final Map<String, double> _times = {};

  @override
  void initState() {
    super.initState();
    _loadSavings();
  }

  Future<void> _loadSavings() async {
    final prefs = await SharedPreferences.getInstance();
    final costs = <String, double>{};
    final times = <String, double>{};
    for (final k in prefs.getKeys()) {
      if (k.startsWith('gitty_cost_')) {
        final v = prefs.getDouble(k);
        if (v != null) costs[k.substring('gitty_cost_'.length)] = v;
      } else if (k.startsWith('gitty_time_')) {
        final v = prefs.getDouble(k);
        if (v != null) times[k.substring('gitty_time_'.length)] = v;
      }
    }
    if (!mounted) return;
    setState(() {
      _costs
        ..clear()
        ..addAll(costs);
      _times
        ..clear()
        ..addAll(times);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<AddictionProvider>(
      builder: (context, addictions, child) {
        final entries = _buildStatEntries(l10n, addictions);

        if (entries.isEmpty) {
          return AppEmptyState(
            icon: Icons.bar_chart_rounded,
            title: l10n.statsNoAddictions,
            actionLabel: l10n.homeAddButton,
            actionIcon: Icons.add_rounded,
            onAction: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const AddAddictionPage())),
          );
        }

        final totalDays = entries.fold(0, (sum, e) => sum + e.days);
        final moneySaved = entries.fold(
          0.0,
          (sum, e) => sum + (e.costPerDay ?? 0) * e.days,
        );
        final hoursSaved = entries.fold(
          0.0,
          (sum, e) => sum + (e.hoursPerDay ?? 0) * e.days,
        );
        final totalRelapses = entries.fold(0, (sum, e) => sum + e.relapseCount);
        final totalRelapseDays = entries.fold(
          0,
          (sum, e) => sum + e.totalRelapseDays,
        );

        final moneyEntries = entries
            .where((e) => e.costPerDay != null && e.costPerDay! > 0)
            .toList();
        final timeEntries = entries
            .where((e) => e.hoursPerDay != null && e.hoursPerDay! > 0)
            .toList();
        final sortedByStreak = [...entries]
          ..sort((a, b) => b.days.compareTo(a.days));

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 24,
                bottom: 12,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  l10n.statsTitle,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: _JourneyCard(
                  totalDays: totalDays,
                  addictionCount: entries.length,
                  l10n: l10n,
                ),
              ),
            ),
            if (moneySaved > 0) ...[
              const SliverToBoxAdapter(child: SizedBox(height: 14)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: _MoneySavedCard(
                    moneySaved: moneySaved,
                    moneyEntries: moneyEntries,
                    l10n: l10n,
                  ),
                ),
              ),
            ],
            if (hoursSaved >= 1) ...[
              const SliverToBoxAdapter(child: SizedBox(height: 14)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: _TimeSavedCard(
                    hoursSaved: hoursSaved,
                    timeEntries: timeEntries,
                    l10n: l10n,
                  ),
                ),
              ),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: 14)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: _StreaksCard(entries: sortedByStreak, l10n: l10n),
              ),
            ),
            if (totalRelapses > 0) ...[
              const SliverToBoxAdapter(child: SizedBox(height: 14)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: _ResilienceCard(
                    totalRelapses: totalRelapses,
                    totalRelapseDays: totalRelapseDays,
                    l10n: l10n,
                  ),
                ),
              ),
            ],
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24 + MediaQuery.of(context).padding.bottom,
              ),
            ),
          ],
        );
      },
    );
  }

  List<_StatEntry> _buildStatEntries(
    AppLocalizations l10n,
    AddictionProvider addictions,
  ) {
    final entries = <_StatEntry>[];

    void addPreset(
      String? quitDate,
      String name,
      IconData icon,
      Color color, {
      double? costPerDay,
      double? hoursPerDay,
      String? key,
    }) {
      if (quitDate == null) return;
      final days = daysCeil(quitDate);
      final allDays = key != null ? addictions.getDays(key) : <int>[];
      final userCost = key == null ? null : _costs[key];
      final userMinutes = key == null ? null : _times[key];
      final effectiveCost = (userCost != null && userCost > 0)
          ? userCost
          : costPerDay;
      final effectiveHours = (userMinutes != null && userMinutes > 0)
          ? userMinutes / 60
          : hoursPerDay;
      entries.add(
        _StatEntry(
          name: name,
          icon: icon,
          color: color,
          days: days,
          costPerDay: effectiveCost,
          hoursPerDay: effectiveHours,
          relapseCount: allDays.length,
          totalRelapseDays: allDays.fold(0, (s, d) => s + d),
        ),
      );
    }

    addPreset(
      addictions.quitAlcohol,
      l10n.addictionAlcohol,
      Icons.sports_bar_rounded,
      const Color(0xFF6366F1),
      costPerDay: 7.14,
      key: 'alcohol',
    );
    addPreset(
      addictions.quitSmoking,
      l10n.addictionSmoking,
      Icons.smoking_rooms_rounded,
      const Color(0xFF10B981),
      costPerDay: 10.0,
      key: 'smoking',
    );
    addPreset(
      addictions.quitVaping,
      l10n.addictionVaping,
      Icons.cloud_rounded,
      const Color(0xFF06B6D4),
      costPerDay: 5.0,
      key: 'vaping',
    );
    addPreset(
      addictions.quitMarijuana,
      l10n.addictionMarijuana,
      Icons.grass_rounded,
      const Color(0xFF84E680),
      costPerDay: 4.29,
      key: 'marijuana',
    );
    addPreset(
      addictions.quitPouches,
      l10n.addictionNicotinePouches,
      Icons.blur_circular_rounded,
      const Color(0xFFF59E0B),
      costPerDay: 5.0,
      key: 'nicotine_pouches',
    );
    addPreset(
      addictions.quitSocialMedia,
      l10n.addictionSocialMedia,
      Icons.smartphone_rounded,
      const Color(0xFF8B5CF6),
      hoursPerDay: 2.5,
      key: 'social_media',
    );
    addPreset(
      addictions.quitPornography,
      l10n.addictionAdultContent,
      Icons.visibility_off_rounded,
      const Color(0xFFF43F5E),
      hoursPerDay: 1.0,
      key: 'pornography',
    );
    addPreset(
      addictions.quitOpioids,
      l10n.addictionOpioids,
      Icons.medication_rounded,
      const Color(0xFFEC4899),
      key: 'opioids',
    );
    addPreset(
      addictions.quitCocaine,
      l10n.addictionCocaine,
      Icons.ac_unit_rounded,
      const Color(0xFF3B82F6),
      key: 'cocaine',
    );
    addPreset(
      addictions.quitMeth,
      l10n.addictionMeth,
      Icons.diamond_outlined,
      const Color(0xFF14B8A6),
      key: 'meth',
    );
    addPreset(
      addictions.quitBenzos,
      l10n.addictionBenzos,
      Icons.bedtime_rounded,
      const Color(0xFF6D5DD3),
      key: 'benzos',
    );
    addPreset(
      addictions.quitAdderall,
      l10n.addictionAdderall,
      Icons.rocket_launch_rounded,
      const Color(0xFFFF8C42),
      key: 'adderall',
    );
    addPreset(
      addictions.quitSsri,
      l10n.addictionSsri,
      Icons.psychology_rounded,
      const Color(0xFF7C3AED),
      key: 'ssri',
    );
    addPreset(
      addictions.quitSnri,
      l10n.addictionSnri,
      Icons.psychology_alt_rounded,
      const Color(0xFF6D28D9),
      key: 'snri',
    );
    addPreset(
      addictions.quitTca,
      l10n.addictionTca,
      Icons.medication_liquid_rounded,
      const Color(0xFF5B21B6),
      key: 'tca',
    );
    addPreset(
      addictions.quitMaoi,
      l10n.addictionMaoi,
      Icons.science_rounded,
      const Color(0xFF4C1D95),
      key: 'maoi',
    );
    addPreset(
      addictions.quitKratom,
      l10n.addictionKratom,
      Icons.local_florist_rounded,
      const Color(0xFF6D9F4E),
      key: 'kratom',
    );
    addPreset(
      addictions.quitGabapentinoids,
      l10n.addictionGabapentinoid,
      Icons.medication_outlined,
      const Color(0xFF94A3B8),
      key: 'gabapentinoids',
    );
    addPreset(
      addictions.quitGhb,
      l10n.addictionGhb,
      Icons.water_drop_rounded,
      const Color(0xFF60A5FA),
      key: 'ghb',
    );
    addPreset(
      addictions.quitKetamine,
      l10n.addictionKetamine,
      Icons.blur_on_rounded,
      const Color(0xFF818CF8),
      key: 'ketamine',
    );
    addPreset(
      addictions.quitInhalants,
      l10n.addictionInhalants,
      Icons.air_rounded,
      const Color(0xFF9CA3AF),
      key: 'inhalants',
    );
    addPreset(
      addictions.quitSyntheticCannabinoids,
      l10n.addictionSyntheticCannabinoids,
      Icons.whatshot_rounded,
      const Color(0xFFA3E635),
      key: 'synthetic_cannabinoids',
    );
    addPreset(
      addictions.quitMdma,
      l10n.addictionMdma,
      Icons.celebration_rounded,
      const Color(0xFFF472B6),
      key: 'mdma',
    );
    addPreset(
      addictions.quitSteroids,
      l10n.addictionSteroids,
      Icons.fitness_center_rounded,
      const Color(0xFFEF4444),
      key: 'steroids',
    );
    addPreset(
      addictions.quitNitrousOxide,
      l10n.addictionNitrousOxide,
      Icons.sentiment_very_satisfied_rounded,
      const Color(0xFF38BDF8),
      key: 'nitrous_oxide',
    );
    addPreset(
      addictions.quitFentanyl,
      l10n.addictionFentanyl,
      Icons.warning_amber_rounded,
      const Color(0xFFDC2626),
      key: 'fentanyl',
    );
    addPreset(
      addictions.quitSmokelessTobacco,
      l10n.addictionSmokelessTobacco,
      Icons.spa_rounded,
      const Color(0xFF92400E),
      key: 'smokeless_tobacco',
    );
    addPreset(
      addictions.quitHeroin,
      l10n.addictionHeroin,
      Icons.vaccines_rounded,
      const Color(0xFFB91C1C),
      key: 'heroin',
    );

    for (final entry in addictions.entries) {
      final days = daysCeil(entry.quitDate.toIso8601String());
      final customColor = addictions.customColors[entry.id] ?? entry.color;
      final userCost = _costs[entry.id];
      final userMinutes = _times[entry.id];
      entries.add(
        _StatEntry(
          name: addictions.customNames[entry.id] ?? entry.title,
          icon: addictions.customIcons[entry.id] ?? entry.icon ?? Icons.star,
          color: customColor,
          days: days,
          costPerDay: (userCost != null && userCost > 0) ? userCost : null,
          hoursPerDay: (userMinutes != null && userMinutes > 0)
              ? userMinutes / 60
              : null,
          relapseCount: entry.daysAchieved.length,
          totalRelapseDays: entry.daysAchieved.fold(0, (s, d) => s + d),
        ),
      );
    }

    return entries;
  }
}

class _StatEntry {
  final String name;
  final IconData icon;
  final Color color;
  final int days;
  final double? costPerDay;
  final double? hoursPerDay;
  final int relapseCount;
  final int totalRelapseDays;

  const _StatEntry({
    required this.name,
    required this.icon,
    required this.color,
    required this.days,
    this.costPerDay,
    this.hoursPerDay,
    this.relapseCount = 0,
    this.totalRelapseDays = 0,
  });
}

class _StatPanel extends StatelessWidget {
  const _StatPanel({required this.color, required this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: comicInk, width: 2.5),
      ),
      child: child,
    );
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow({required this.icon, required this.title, this.badge});

  final IconData icon;
  final String title;
  final Color? badge;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: badge ?? Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: comicInk, width: 2.5),
          ),
          child: Icon(icon, color: comicInk, size: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: comicInk,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}

class _JourneyCard extends StatelessWidget {
  const _JourneyCard({
    required this.totalDays,
    required this.addictionCount,
    required this.l10n,
  });

  final int totalDays;
  final int addictionCount;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _StatPanel(
      color: comicYellow,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.statsJourneyTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: comicInk,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$totalDays',
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: comicInk,
                        fontWeight: FontWeight.w900,
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        l10n.statsDayUnit(totalDays),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: comicInk,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.statsAddictionsTracked(addictionCount),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: comicInk,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: comicInk, width: 3),
            ),
            child: const Icon(
              Icons.emoji_events_rounded,
              color: comicInk,
              size: 34,
            ),
          ),
        ],
      ),
    );
  }
}

class _MoneySavedCard extends StatelessWidget {
  const _MoneySavedCard({
    required this.moneySaved,
    required this.moneyEntries,
    required this.l10n,
  });

  final double moneySaved;
  final List<_StatEntry> moneyEntries;
  final AppLocalizations l10n;

  String _equivalence(double amount, AppLocalizations l) {
    if (amount >= 2000) return l.statsEquivalentVacation;
    if (amount >= 500) return l.statsEquivalentFlight;
    if (amount >= 100) return l.statsEquivalentMeals((amount / 25).round());
    return l.statsEquivalentCoffees((amount / 5).round());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currencyFmt = NumberFormat.currency(
      locale: l10n.localeName,
      symbol: '€',
      decimalDigits: 0,
    );
    final equivalence = _equivalence(moneySaved, l10n);

    return _StatPanel(
      color: comicMint,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TitleRow(icon: Icons.savings_rounded, title: l10n.statsMoneySavedTitle),
          const SizedBox(height: 16),
          Text(
            currencyFmt.format(moneySaved.round()),
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: comicInk,
              height: 1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            equivalence,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: comicInk,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ...moneyEntries.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(e.icon, size: 20, color: comicInk),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      e.name,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: comicInk,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${currencyFmt.format((e.costPerDay! * e.days).round())}  ·  ${l10n.statsDaysSuffix(e.days)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: comicInk,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.statsMoneySavedEstimate,
            style: theme.textTheme.bodySmall?.copyWith(
              color: comicInk,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeSavedCard extends StatelessWidget {
  const _TimeSavedCard({
    required this.hoursSaved,
    required this.timeEntries,
    required this.l10n,
  });

  final double hoursSaved;
  final List<_StatEntry> timeEntries;
  final AppLocalizations l10n;

  String _equivalence(double hours, AppLocalizations l) {
    final movies = (hours / 2).round();
    final books = (hours / 6).round();
    if (books >= 3) return l.statsEquivalentBooks(books);
    return l.statsEquivalentMovies(movies.clamp(1, 9999));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final equivalence = _equivalence(hoursSaved, l10n);

    return _StatPanel(
      color: comicBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TitleRow(
            icon: Icons.access_time_filled_rounded,
            title: l10n.statsTimeSavedTitle,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.statsHoursSaved(hoursSaved.round()),
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: comicInk,
              height: 1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            equivalence,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: comicInk,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          ...timeEntries.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Icon(e.icon, size: 20, color: comicInk),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      e.name,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: comicInk,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${l10n.statsHoursSuffix((e.hoursPerDay! * e.days).round())}  ·  ${l10n.statsDaysSuffix(e.days)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: comicInk,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StreaksCard extends StatelessWidget {
  const _StreaksCard({required this.entries, required this.l10n});

  final List<_StatEntry> entries;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final maxDays = entries.isEmpty
        ? 1
        : entries.map((e) => e.days).reduce((a, b) => a > b ? a : b);

    return _StatPanel(
      color: comicPink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TitleRow(
            icon: Icons.local_fire_department_rounded,
            title: l10n.statsStreaksTitle,
          ),
          const SizedBox(height: 16),
          ...entries.asMap().entries.map((mapEntry) {
            final i = mapEntry.key;
            final e = mapEntry.value;
            final fraction = maxDays > 0 ? e.days / maxDays : 0.0;
            return Padding(
              padding: EdgeInsets.only(bottom: i < entries.length - 1 ? 14 : 0),
              child: _StreakBar(
                entry: e,
                fraction: fraction.clamp(0.0, 1.0),
                l10n: l10n,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _StreakBar extends StatelessWidget {
  const _StreakBar({
    required this.entry,
    required this.fraction,
    required this.l10n,
  });

  final _StatEntry entry;
  final double fraction;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(entry.icon, size: 18, color: comicInk),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                entry.name,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: comicInk,
                  fontWeight: FontWeight.w800,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              l10n.statsDaysSuffix(entry.days),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: comicInk,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: comicInk, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: fraction,
              minHeight: 14,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(entry.color),
            ),
          ),
        ),
      ],
    );
  }
}

class _ResilienceCard extends StatelessWidget {
  const _ResilienceCard({
    required this.totalRelapses,
    required this.totalRelapseDays,
    required this.l10n,
  });

  final int totalRelapses;
  final int totalRelapseDays;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avgDays = totalRelapses > 0
        ? (totalRelapseDays / totalRelapses).round()
        : 0;

    return _StatPanel(
      color: _peach,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TitleRow(
            icon: Icons.trending_up_rounded,
            title: l10n.statsResilienceTitle,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.statsTimesBouncedBack(totalRelapses),
            style: theme.textTheme.bodyLarge?.copyWith(
              color: comicInk,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (avgDays > 0) ...[
            const SizedBox(height: 6),
            Text(
              l10n.statsDaysBeforeRelapse(avgDays),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: comicInk,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
