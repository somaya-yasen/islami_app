import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings_tab/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dark Mode', style: Theme.of(context).textTheme.bodySmall),
            Switch(
                value:
                    settingsProvider.themeMode == ThemeMode.dark ? true : false,
                onChanged: (bool newvalue) {
                  settingsProvider
                      .setMode(newvalue ? ThemeMode.dark : ThemeMode.light);
                },
                activeTrackColor: AppTheme.gold,
                inactiveTrackColor: AppTheme.grey)
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Language', style: Theme.of(context).textTheme.bodySmall),
          DropdownButton<String>(
            value: settingsProvider.language,
            items: [
              DropdownMenuItem(
                child: Text('english'),
                value: 'en',
              ),
              DropdownMenuItem(
                child: Text(
                  'العربية',
                ),
                value: 'ar',
              ),
            ],
            onChanged: (String? newvalue) {
              if (newvalue != null) {
                settingsProvider.setLanguage(newvalue);
              }
            },
          ),
        ])
      ],
    );
  }
}
