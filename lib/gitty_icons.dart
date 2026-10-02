import 'package:flutter/material.dart';

class _IconPair {
  const _IconPair(this.old, this.neu);

  final IconData old;
  final IconData neu;
}

const _icons = <String, _IconPair>{
  'adderall': _IconPair(Icons.lightbulb_outline, Icons.rocket_launch_rounded),
  'ssri': _IconPair(Icons.psychology, Icons.psychology_rounded),
  'snri': _IconPair(Icons.psychology_alt, Icons.psychology_alt_rounded),
  'tca': _IconPair(Icons.medication_liquid, Icons.medication_liquid_rounded),
  'maoi': _IconPair(Icons.science, Icons.science_rounded),
  'nitrous_oxide': _IconPair(
    Icons.air_outlined,
    Icons.sentiment_very_satisfied_rounded,
  ),
  'kratom': _IconPair(Icons.local_florist, Icons.local_florist_rounded),
  'gabapentinoids': _IconPair(
    Icons.medication_outlined,
    Icons.medication_outlined,
  ),
  'ghb': _IconPair(Icons.water_drop, Icons.water_drop_rounded),
  'ketamine': _IconPair(Icons.vaccines, Icons.blur_on_rounded),
  'inhalants': _IconPair(Icons.local_gas_station, Icons.air_rounded),
  'synthetic_cannabinoids': _IconPair(
    Icons.whatshot,
    Icons.whatshot_rounded,
  ),
  'mdma': _IconPair(Icons.favorite, Icons.celebration_rounded),
  'steroids': _IconPair(Icons.fitness_center, Icons.fitness_center_rounded),
  'alcohol': _IconPair(Icons.local_bar, Icons.sports_bar_rounded),
  'benzos': _IconPair(Icons.bedtime, Icons.bedtime_rounded),
  'cocaine': _IconPair(Icons.bolt, Icons.ac_unit_rounded),
  'marijuana': _IconPair(Icons.grass, Icons.grass_rounded),
  'meth': _IconPair(Icons.battery_charging_full, Icons.diamond_outlined),
  'nicotine_pouches': _IconPair(
    Icons.scatter_plot,
    Icons.blur_circular_rounded,
  ),
  'opioids': _IconPair(Icons.medication, Icons.medication_rounded),
  'heroin': _IconPair(Icons.medication, Icons.vaccines_rounded),
  'fentanyl': _IconPair(Icons.medication, Icons.warning_amber_rounded),
  'pornography': _IconPair(Icons.block, Icons.visibility_off_rounded),
  'smoking': _IconPair(Icons.eco, Icons.smoking_rooms_rounded),
  'smokeless_tobacco': _IconPair(Icons.grass, Icons.spa_rounded),
  'social_media': _IconPair(Icons.public, Icons.smartphone_rounded),
  'vaping': _IconPair(Icons.air, Icons.cloud_rounded),
};

IconData gittyIcon(String key, IconData given) {
  final pair = _icons[key];
  if (pair != null && given == pair.old) return pair.neu;
  return given;
}

const _taglines = <String, String>{
  'alcohol': 'Der Kater kommt auch ohne Einladung.',
  'marijuana': 'Der Kühlschrank wird dich nicht vermissen.',
  'cocaine': 'Weiß, teuer und ziemlich laut im Kopf.',
  'smoking': 'Rauchzeichen: Die Lunge sagt Danke.',
  'vaping': 'Mango-Eis ist kein Obst.',
  'nicotine_pouches': 'Kleine Kissen, großer Haken.',
  'smokeless_tobacco': 'Dicke Lippe, dünne Ausreden.',
  'social_media': 'Daumen hoch für dein echtes Leben.',
  'pornography': 'Tab zu, Kopf auf.',
  'benzos': 'Ruhig, ruhig. Aber bitte mit Plan.',
  'mdma': 'Dienstag-Tief inklusive.',
  'steroids': 'Große Muskeln, kleine Nebenwirkungen. Meistens.',
  'opioids': 'Bitte nicht allein. Such dir ärztliche Hilfe.',
  'heroin': 'Bitte nicht allein. Such dir ärztliche Hilfe.',
  'fentanyl': 'Bitte nicht allein. Such dir ärztliche Hilfe.',
};

String? gittyTagline(String key) => _taglines[key];
