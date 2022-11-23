import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_sat/provider/settings_provider.dart';
import 'package:islami_c7_sat/suraDetails/verse_item.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    SuraDetailsScreenArgs args =
        (ModalRoute.of(context)?.settings.arguments) as SuraDetailsScreenArgs;
    // print(args.name);
    //print(args.index);
    if (verses.isEmpty) readFile(args.index);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(provider.getMainBackground()))),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.name),
          ),
          body: Card(
            elevation: 18,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(vertical: 64, horizontal: 16),
            child: verses.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                itemBuilder: (_, index) {
                  return VerseWidget(verses[index], index + 1);
                },
                itemCount: verses.length,
                separatorBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                        height: 1,
                        width: double.infinity,
                        color: Theme.of(context).accentColor,
                      );
                }),
          ),
        ));
  }

  void readFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    var lines = content.split('\n');
    setState(() {
      verses = lines;
    });
  }
}

class SuraDetailsScreenArgs {
  int index;
  String name;

//  SuraDetailsScreenArgs(this.index, this.name);
  SuraDetailsScreenArgs({required this.index, required this.name});
}
