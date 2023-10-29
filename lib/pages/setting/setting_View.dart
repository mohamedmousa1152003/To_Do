import 'package:flutter/material.dart';
import 'package:to_do_final/pages/setting/widget/language.dart';
import 'package:to_do_final/pages/setting/widget/text_item.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: theme.primaryColor,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            "Setting",
            style: theme.textTheme.titleLarge,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SettingItems(
              settingTitle: "Language",
              settingOption: "English",
              onOptionTaped: () {
                showLanguageBottomSheet(context);
              },
            ),
            const SizedBox(height: 20),
            SettingItems(
              settingTitle: "Mode",
              settingOption: "light",
              onOptionTaped: () {
                showThemeBottomSheet(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

void showLanguageBottomSheet(context) {
  showBottomSheet(context: context, builder: (context) => Language());
}

void showThemeBottomSheet(context) {
  showBottomSheet(
      context: context,
      builder: (context) => Container(
            color: Colors.white,
          ));
}
