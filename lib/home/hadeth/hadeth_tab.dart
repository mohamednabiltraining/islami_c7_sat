import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_sat/home/hadeth/hadeth_model.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> allHadethItems = [];

  @override
  Widget build(BuildContext context) {
    if (allHadethItems.isEmpty) readHadethFile();
    return Container(
        child: allHadethItems.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (_, index) {
                  return Text(allHadethItems[index].title);
                },
                itemCount: allHadethItems.length,
              ));
  }

  void readHadethFile() async {
    List<HadethModel> allHadeth = [];
    var fileContent = await rootBundle.loadString('assets/files/ahadeth.txt');
    var allHadethContent = fileContent.trim().split("#");
    for (int i = 0; i < allHadethContent.length; i++) {
      String singleHadethConent = allHadethContent[i];
      var singlHadethLines = singleHadethConent.trim().split('\r\n');
      String title = singlHadethLines[0];
      singlHadethLines.removeAt(0);
      String content = singlHadethLines.join("\n");
      HadethModel hadeth = HadethModel(title: title, content: content);
      allHadeth.add(hadeth);
    }
    setState(() {
      allHadethItems = allHadeth;
    });
  }
}
