import 'package:flutter/material.dart';
import 'package:flutter_localization/controller/language_change_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Languages { english, spanish }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloworld),
        actions: [
          Consumer<ChangeLanguage>(builder: (context, provider, child) {
            return PopupMenuButton(
                onSelected: (Languages items) {
                  if (Languages.english.name == items.name) {
                    provider.changeLocale(Locale("en"));
                  }else{
                    provider.changeLocale(Locale("es"));
                  }
                },
                itemBuilder: (context) => <PopupMenuEntry<Languages>>[
                      PopupMenuItem(
                        child: Text("English"),
                        value: Languages.english,
                      ),
                      PopupMenuItem(
                        child: Text("Spanish"),
                        value: Languages.spanish,
                      )
                    ]);
          })
        ],
      ),
    );
  }
}
