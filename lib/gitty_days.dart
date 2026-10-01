import 'package:quitter/gitty_content.dart';
import 'package:quitter/gitty_content_more.dart';
import 'package:quitter/gitty_content_week3.dart';

GittyDay? gittyDayAll(String habitKey, int dayNumber) =>
    gittyDayAnyFor(habitKey, dayNumber) ?? gittyWeek3For(habitKey, dayNumber);
