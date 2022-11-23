import 'package:flutter/material.dart';
import 'package:islami_c7_sat/hadethDetails/hadeth_details.dart';
import 'package:islami_c7_sat/home/home_screen.dart';
import 'package:islami_c7_sat/my_theme.dart';
import 'package:islami_c7_sat/provider/settings_provider.dart';
import 'package:islami_c7_sat/suraDetails/sura_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (buildContext) => SettingsProvider(),
    child: MyApplication(),
  ));
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen()
      },
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingsProvider.currentTheme,
    );
  }
}
