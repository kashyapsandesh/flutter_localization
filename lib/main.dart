import 'package:flutter/material.dart';
import 'package:flutter_localization/controller/language_change_controller.dart';
import 'package:flutter_localization/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  final String localeLanguage = sp.getString('language_code') ?? "";

  runApp(MyApp(
    locale: localeLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final String locale;
  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ChangeLanguage()),
        ],
        child: Consumer<ChangeLanguage>(builder: (context, provider, child) {
          if (locale.isEmpty) {
            provider.changeLocale(Locale('en'));
          }
          return MaterialApp(
            locale: locale == "" ? Locale("en") : provider.applocale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'), // English
              Locale('es'), // Spanish
            ],
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          );
        }));
  }
}
