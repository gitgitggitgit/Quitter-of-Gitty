import 'package:flutter/material.dart';

class ComicPalette {
  static const ink = Color(0xFF16161D);
  static const cream = Color(0xFFFFF8E7);
  static const paper = Color(0xFFFFFDF5);
  static const red = Color(0xFFE5484D);
  static const redDark = Color(0xFFB3262B);
  static const coral = Color(0xFFFF7A7F);
  static const mint = Color(0xFFB8F0D0);
  static const pink = Color(0xFFFFC2D9);
  static const yellow = Color(0xFFFFE680);
  static const blue = Color(0xFFB9D7FF);
  static const green = Color(0xFF1F6F4F);
  static const night = Color(0xFF16161D);
  static const nightCard = Color(0xFF24242F);
  static const nightSoft = Color(0xFFC9C9D6);
}

RoundedRectangleBorder _rr(double radius, BorderSide side) =>
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
      side: side,
    );

ThemeData buildComicTheme(Brightness brightness, {bool pureBlack = false}) {
  final dark = brightness == Brightness.dark;
  final bg = dark
      ? (pureBlack ? Colors.black : ComicPalette.night)
      : ComicPalette.cream;
  final card = dark
      ? (pureBlack ? const Color(0xFF111111) : ComicPalette.nightCard)
      : ComicPalette.paper;
  final fg = dark ? ComicPalette.cream : ComicPalette.ink;
  final soft = dark ? ComicPalette.nightSoft : const Color(0xFF4A4A55);
  final line = dark ? ComicPalette.cream : ComicPalette.ink;
  final accent = dark ? ComicPalette.yellow : ComicPalette.redDark;
  final onAccent = dark ? ComicPalette.ink : Colors.white;
  final fieldFill = dark ? card : Colors.white;
  final muted = dark ? const Color(0xFF38384A) : const Color(0xFFE6E0CF);

  final thick = BorderSide(color: line, width: 3);
  final thin = BorderSide(color: line, width: 2.5);

  final scheme = ColorScheme(
    brightness: brightness,
    primary: accent,
    onPrimary: onAccent,
    primaryContainer: ComicPalette.yellow,
    onPrimaryContainer: ComicPalette.ink,
    secondary: dark ? ComicPalette.mint : ComicPalette.green,
    onSecondary: dark ? ComicPalette.ink : Colors.white,
    secondaryContainer: ComicPalette.mint,
    onSecondaryContainer: ComicPalette.ink,
    tertiary: dark ? ComicPalette.pink : const Color(0xFF8E2A5A),
    onTertiary: dark ? ComicPalette.ink : Colors.white,
    tertiaryContainer: ComicPalette.pink,
    onTertiaryContainer: ComicPalette.ink,
    error: dark ? ComicPalette.coral : ComicPalette.redDark,
    onError: dark ? ComicPalette.ink : Colors.white,
    errorContainer: ComicPalette.pink,
    onErrorContainer: ComicPalette.ink,
    surface: bg,
    onSurface: fg,
    onSurfaceVariant: soft,
    surfaceContainerLowest: dark ? bg : Colors.white,
    surfaceContainerLow: card,
    surfaceContainer: card,
    surfaceContainerHigh:
        dark ? const Color(0xFF2E2E3B) : const Color(0xFFFFF1D0),
    surfaceContainerHighest:
        dark ? const Color(0xFF38384A) : const Color(0xFFFFEAB8),
    surfaceTint: Colors.transparent,
    outline: line,
    outlineVariant: dark ? const Color(0xFF5A5A6B) : const Color(0xFF8A8A97),
    inverseSurface: dark ? ComicPalette.cream : ComicPalette.ink,
    onInverseSurface: dark ? ComicPalette.ink : ComicPalette.cream,
    inversePrimary: ComicPalette.yellow,
    shadow: ComicPalette.ink,
    scrim: Colors.black,
  );

  final base = ThemeData(brightness: brightness, useMaterial3: true).textTheme
      .apply(bodyColor: fg, displayColor: fg);
  final textTheme = base.copyWith(
    headlineLarge: base.headlineLarge?.copyWith(fontWeight: FontWeight.w900),
    headlineMedium: base.headlineMedium?.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w900,
    ),
    headlineSmall: base.headlineSmall?.copyWith(
      fontSize: 26,
      fontWeight: FontWeight.w900,
    ),
    titleLarge: base.titleLarge?.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w900,
    ),
    titleMedium: base.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w800,
    ),
    titleSmall: base.titleSmall?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ),
    bodyLarge: base.bodyLarge?.copyWith(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
    bodyMedium: base.bodyMedium?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
    bodySmall: base.bodySmall?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.35,
    ),
    labelLarge: base.labelLarge?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ),
    labelMedium: base.labelMedium?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w800,
    ),
    labelSmall: base.labelSmall?.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.w800,
    ),
  );

  final buttonShape = _rr(16, thick);

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: scheme,
    scaffoldBackgroundColor: bg,
    canvasColor: bg,
    dividerColor: line,
    splashColor: accent.withValues(alpha: 0.2),
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    iconTheme: IconThemeData(color: fg, size: 26),
    appBarTheme: AppBarTheme(
      backgroundColor: dark ? card : ComicPalette.yellow,
      foregroundColor: dark ? ComicPalette.cream : ComicPalette.ink,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: textTheme.titleLarge?.copyWith(
        color: dark ? ComicPalette.cream : ComicPalette.ink,
      ),
      iconTheme: IconThemeData(
        color: dark ? ComicPalette.cream : ComicPalette.ink,
        size: 28,
      ),
      shape: Border(bottom: thick),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: fg,
      unselectedLabelColor: soft,
      labelStyle: textTheme.labelMedium,
      unselectedLabelStyle: textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.w700,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: accent, width: 4),
        borderRadius: BorderRadius.circular(4),
      ),
      dividerColor: Colors.transparent,
    ),
    cardTheme: CardThemeData(
      color: card,
      elevation: 0,
      margin: EdgeInsets.zero,
      surfaceTintColor: Colors.transparent,
      shape: _rr(20, thin),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: accent,
        foregroundColor: onAccent,
        disabledBackgroundColor: muted,
        disabledForegroundColor: soft,
        minimumSize: const Size(64, 52),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: buttonShape,
        textStyle: textTheme.labelLarge,
        elevation: 0,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ComicPalette.yellow,
        foregroundColor: ComicPalette.ink,
        disabledBackgroundColor: muted,
        disabledForegroundColor: soft,
        minimumSize: const Size(64, 52),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: buttonShape,
        textStyle: textTheme.labelLarge,
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: fg,
        backgroundColor: card,
        minimumSize: const Size(64, 52),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        side: thick,
        shape: buttonShape,
        textStyle: textTheme.labelLarge,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: dark ? ComicPalette.yellow : ComicPalette.redDark,
        minimumSize: const Size(48, 48),
        textStyle: textTheme.labelLarge,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: fg,
        iconSize: 26,
        minimumSize: const Size(48, 48),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ComicPalette.yellow,
      foregroundColor: ComicPalette.ink,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      extendedTextStyle: textTheme.labelLarge?.copyWith(
        color: ComicPalette.ink,
      ),
      shape: _rr(18, BorderSide(color: line, width: 3)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: fieldFill,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: thick,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: thick,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: accent, width: 4),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: scheme.error, width: 3),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: scheme.error, width: 4),
      ),
      labelStyle: textTheme.bodyMedium?.copyWith(
        color: fg,
        fontWeight: FontWeight.w700,
      ),
      floatingLabelStyle: textTheme.bodyMedium?.copyWith(
        color: fg,
        fontWeight: FontWeight.w800,
      ),
      hintStyle: textTheme.bodyMedium?.copyWith(color: soft),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: dark ? ComicPalette.cream : ComicPalette.ink,
      contentTextStyle: textTheme.bodyMedium?.copyWith(
        color: dark ? ComicPalette.ink : ComicPalette.cream,
        fontWeight: FontWeight.w700,
      ),
      actionTextColor: dark ? ComicPalette.redDark : ComicPalette.yellow,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: card,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: _rr(24, thick),
      titleTextStyle: textTheme.titleLarge,
      contentTextStyle: textTheme.bodyMedium,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: card,
      modalBackgroundColor: card,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      showDragHandle: true,
      dragHandleColor: line,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        side: thick,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: card,
      selectedColor: dark ? const Color(0xFF4A4320) : ComicPalette.yellow,
      side: thin,
      shape: const StadiumBorder(),
      labelStyle: textTheme.labelMedium?.copyWith(color: fg),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>(
        (states) => states.contains(WidgetState.selected)
            ? onAccent
            : (dark ? ComicPalette.cream : ComicPalette.ink),
      ),
      trackColor: WidgetStateProperty.resolveWith<Color?>(
        (states) => states.contains(WidgetState.selected) ? accent : muted,
      ),
      trackOutlineColor: WidgetStatePropertyAll(line),
      trackOutlineWidth: const WidgetStatePropertyAll(2.5),
    ),
    checkboxTheme: CheckboxThemeData(
      side: thin,
      fillColor: WidgetStateProperty.resolveWith<Color?>(
        (states) =>
            states.contains(WidgetState.selected) ? accent : Colors.transparent,
      ),
      checkColor: WidgetStatePropertyAll(onAccent),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: fg,
      textColor: fg,
      titleTextStyle: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
      subtitleTextStyle: textTheme.bodyMedium?.copyWith(color: soft),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minVerticalPadding: 10,
    ),
    dividerTheme: DividerThemeData(color: line, thickness: 2, space: 24),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: accent,
      linearTrackColor: muted,
      linearMinHeight: 12,
      borderRadius: BorderRadius.circular(6),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: card,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: _rr(16, thin),
      textStyle: textTheme.bodyLarge,
    ),
  );
}
