import 'package:flutter/material.dart';
import 'package:islami_c7_sat/home/hadeth/hadeth_tab.dart';
import 'package:islami_c7_sat/home/quran/quran_tab.dart';
import 'package:islami_c7_sat/home/radio/radio_tab.dart';
import 'package:islami_c7_sat/home/tasbeh/tasbeh_tab.dart';
import 'package:islami_c7_sat/my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/main_background.png'))),
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
          items: const [
            BottomNavigationBarItem(
                backgroundColor: MyTheme.primaryColor,
                label: 'Quran',
                icon: ImageIcon(
                  AssetImage('assets/images/ic_quran.png'),
                  size: 48,
                )),
            BottomNavigationBarItem(
              backgroundColor: MyTheme.primaryColor,
              label: 'Hadeth',
              icon: ImageIcon(
                AssetImage('assets/images/ic_hadeth.png'),
                size: 48,
              ),
            ),
            BottomNavigationBarItem(
                backgroundColor: MyTheme.primaryColor,
                label: 'Tasbeh',
                icon: ImageIcon(
                  AssetImage('assets/images/ic_sebha.png'),
                  size: 48,
                )),
            BottomNavigationBarItem(
                backgroundColor: MyTheme.primaryColor,
                label: 'Radio',
                icon: ImageIcon(
                  AssetImage('assets/images/ic_radio.png'),
                  size: 48,
                )),
          ],
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  List<Widget> tabs = [QuranTab(), HadethTab(), TasbehTab(), RadioTab()];
}
