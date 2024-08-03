import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami/tabs/quraan_tab/quraan.dart';
import 'package:islami/tabs/sebha_tab/sebha.dart';
import 'package:islami/tabs/settings_tab/settings_provider.dart';
import 'package:islami/tabs/radio_tab/radio.dart';
import 'package:provider/provider.dart';
import 'package:islami/tabs/settings_tab/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentpage = 0;

  final List<Widget> pages = [Quraan(), HadethTab(), Sebha(),RadioTab(), SettingsTab()];

  @override
  Widget build(BuildContext) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.themeMode == ThemeMode.light ?
                'assets/images/background_screen.png': 'assets/images/dark_bg.png'))),
      child: Scaffold(
        appBar: AppBar(
      title: Text(
        AppLocalizations.of(context)!.islami
      ),
    ),
        body: Center(child: pages[currentpage]),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentpage,
            onTap: (value) {
              currentpage = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                label: AppLocalizations.of(context)!.quraan,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                label: AppLocalizations.of(context)!.hadeth,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                label: AppLocalizations.of(context)!.sebha,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                label: AppLocalizations.of(context)!.radio,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings,
              )
            ]),
      ),
    );
  }
}
