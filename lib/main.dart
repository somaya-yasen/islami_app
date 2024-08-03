import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:islami/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami/tabs/hadeth_tab/hadeth_details.dart';
import 'package:islami/tabs/quraan_tab/sura_datails.dart';
import 'package:islami/tabs/radio_tab/radio.dart';
import 'package:islami/tabs/settings_tab/settings_provider.dart';
import 'home_screen.dart';
import 'app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => SettingsProvider(),
    child: IslamiApp(),
  ));
}

class IslamiApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetails.routeName: (_) => HadethDetails(),
        RadioTab.routeName: (_) => RadioTab(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.language),
    );
  }
}



