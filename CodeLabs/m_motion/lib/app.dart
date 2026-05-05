import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reply/router.dart';

import 'colors.dart';
import 'model/email_store.dart';
import 'model/router_provider.dart';

class ReplyApp extends StatefulWidget {
  const ReplyApp({super.key});

  @override
  State<ReplyApp> createState() => _ReplyAppState();
}

class _ReplyAppState extends State<ReplyApp> {
  late final RouterProvider _replyState;
  late final ReplyRouterDelegate _routerDelegate;
  final ReplyRouteInformationParser _routeInformationParser =
      ReplyRouteInformationParser();

  @override
  void initState() {
    super.initState();

    _replyState = RouterProvider(const ReplyHomePath());
    _routerDelegate = ReplyRouterDelegate(replyState: _replyState);
  }

  @override
  void dispose() {
    _routerDelegate.dispose();
    _replyState.dispose(); // ✅ Important fix
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EmailStore()), // ✅ FIXED
      ],
      child: Selector<EmailStore, ThemeMode>(
        selector: (_, emailStore) => emailStore.themeMode,
        builder: (_, themeMode, __) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false, // ✅ Production standard
            routeInformationParser: _routeInformationParser,
            routerDelegate: _routerDelegate,
            themeMode: themeMode,
            title: 'Reply',
            darkTheme: _buildReplyDarkTheme(),
            theme: _buildReplyLightTheme(),
          );
        },
      ),
    );
  }
}

ThemeData _buildReplyLightTheme() {
  final base = ThemeData.light();

  return base.copyWith(
    scaffoldBackgroundColor: ReplyColors.blue50,
    cardColor: ReplyColors.white50,
    colorScheme: const ColorScheme.light(
      primary: ReplyColors.blue700,
      secondary: ReplyColors.orange500,
      surface: ReplyColors.white50,
      error: ReplyColors.red400,
      onPrimary: ReplyColors.white50,
      onSecondary: ReplyColors.black900,
      onSurface: ReplyColors.black900,
      onError: ReplyColors.black900,
    ),
    textTheme: _buildReplyLightTextTheme(base.textTheme),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ReplyColors.blue700,
      modalBackgroundColor: Colors.white.withOpacity(0.7),
    ),
    bottomAppBarTheme: const BottomAppBarThemeData(
      color: ReplyColors.blue700,
    ),
    chipTheme: _buildChipTheme(
      ReplyColors.blue700,
      ReplyColors.lightChipBackground,
      Brightness.light,
    ),
  );
}

ThemeData _buildReplyDarkTheme() {
  final base = ThemeData.dark();

  return base.copyWith(
    scaffoldBackgroundColor: ReplyColors.black900,
    cardColor: ReplyColors.darkCardBackground,
    colorScheme: const ColorScheme.dark(
      primary: ReplyColors.blue200,
      secondary: ReplyColors.orange300,
      surface: ReplyColors.black800,
      error: ReplyColors.red200,
      onPrimary: ReplyColors.black900,
      onSecondary: ReplyColors.black900,
      onSurface: ReplyColors.white50,
      onError: ReplyColors.black900,
    ),
    textTheme: _buildReplyDarkTextTheme(base.textTheme),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ReplyColors.darkDrawerBackground,
      modalBackgroundColor: Colors.black.withOpacity(0.7),
    ),
    bottomAppBarTheme: const BottomAppBarThemeData(
      color: ReplyColors.darkBottomAppBarBackground,
    ),
    chipTheme: _buildChipTheme(
      ReplyColors.blue200,
      ReplyColors.darkChipBackground,
      Brightness.dark,
    ),
  );
}

ChipThemeData _buildChipTheme(
  Color primaryColor,
  Color chipBackground,
  Brightness brightness,
) {
  final textColor = brightness == Brightness.dark
      ? ReplyColors.white50
      : ReplyColors.black900;

  return ChipThemeData(
    backgroundColor: primaryColor.withOpacity(0.12),
    disabledColor: primaryColor.withOpacity(0.87),
    selectedColor: primaryColor.withOpacity(0.05),
    secondarySelectedColor: chipBackground,
    padding: const EdgeInsets.all(4),
    shape: const StadiumBorder(),
    labelStyle: GoogleFonts.workSans(color: textColor),
    secondaryLabelStyle: GoogleFonts.workSans(),
    brightness: brightness,
  );
}

TextTheme _buildReplyLightTextTheme(TextTheme base) {
  return base.copyWith(
    headlineMedium: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 34,
      height: 0.9,
      letterSpacing: 0.4,
      color: ReplyColors.black900,
    ),
    headlineSmall: GoogleFonts.workSans(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: 0.27,
      color: ReplyColors.black900,
    ),
    titleLarge: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: 0.18,
      color: ReplyColors.black900,
    ),
    bodyMedium: GoogleFonts.workSans(
      fontSize: 14,
      letterSpacing: -0.05,
      color: ReplyColors.black900,
    ),
  );
}

TextTheme _buildReplyDarkTextTheme(TextTheme base) {
  return base.copyWith(
    headlineMedium: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 34,
      height: 0.9,
      letterSpacing: 0.4,
      color: ReplyColors.white50,
    ),
    headlineSmall: GoogleFonts.workSans(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: 0.27,
      color: ReplyColors.white50,
    ),
    titleLarge: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: 0.18,
      color: ReplyColors.white50,
    ),
    bodyMedium: GoogleFonts.workSans(
      fontSize: 14,
      letterSpacing: -0.05,
      color: ReplyColors.white50,
    ),
  );
}
