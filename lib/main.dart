import 'package:flutter/material.dart';
import 'package:islami_c7_sat/home/home_screen.dart';
import 'package:islami_c7_sat/my_theme.dart';
import 'package:islami_c7_sat/suraDetails/sura_details.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}
