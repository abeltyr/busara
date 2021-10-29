import 'package:busara/src/dashboard/controller/index.dart';
import 'package:busara/src/dashboard/controller/second.dart';
import 'package:busara/src/dashboard/controller/wins.dart';
import 'package:busara/src/gameOver/view/index.dart';
import 'package:busara/src/setting/controller/index.dart';
import 'package:busara/src/starterScreen/view/index.dart';
import 'package:busara/utils/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'dashboard/view/index.dart';
import 'package:provider/provider.dart';

// SORRY FOR ANY ONE WHO IS READING THIS CODE IN THE FUTURE THIS WAS MADE WITH IN 24 HOURS SO
// THE CODE IS NOT FORMATTED PROPERLY OR IS NOT WELL DOCUMENTS SO GOOD LUCK READING IT.

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: GameBoardProvider(),
            ),
            ChangeNotifierProvider.value(
              value: GameBoardFirstProvider(),
            ),
            ChangeNotifierProvider.value(
              value: UserWinsProvider(),
            ),
          ],
          child: MaterialApp(
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',

            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: PlatformColorTheme.primaryColor,

              // Define the default font family.
              fontFamily: 'Lora',

              // Define the default `TextTheme`. Use this to specify the default
              // text styling for headlines, titles, bodies of text, and more.
              textTheme: const TextTheme(
                headline1:
                    TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
                headline6:
                    TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
                bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
              ),
            ),

            // darkTheme: ThemeData.dark(),
            // themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case DashboardScreen.routeName:
                      return const DashboardScreen();
                    case GameOver.routeName:
                      return const GameOver();

                    default:
                      return const GameOver();
                    // return const StarterScreen();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
