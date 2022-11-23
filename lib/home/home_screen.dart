import 'package:flutter/material.dart';
import 'package:islami_c7_sat/home/hadeth/hadeth_tab.dart';
import 'package:islami_c7_sat/home/quran/quran_tab.dart';
import 'package:islami_c7_sat/home/radio/radio_tab.dart';
import 'package:islami_c7_sat/home/settings/settings_tab.dart';
import 'package:islami_c7_sat/home/tasbeh/tasbeh_tab.dart';
import 'package:islami_c7_sat/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(settingsProvider.getMainBackground()))),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Islami'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                label: 'Quran',
                icon: ImageIcon(
                  AssetImage('assets/images/ic_quran.png'),
                  size: 36,
                )),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Hadeth',
              icon: ImageIcon(
                AssetImage('assets/images/ic_hadeth.png'),
                size: 36,
              ),
            ),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                label: 'Tasbeh',
                icon: ImageIcon(
                  AssetImage('assets/images/ic_sebha.png'),
                  size: 36,
                )),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                label: 'Radio',
                icon: ImageIcon(
                  AssetImage('assets/images/ic_radio.png'),
                  size: 36,
                )),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                label: 'Settings',
                icon: Icon(
                  Icons.settings,
                  size: 36,
                )),
          ],
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    TasbehTab(),
    RadioTab(),
    SettingsTab()
  ];
}
