import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_sat/home/hadeth/hadeth_model.dart';
import 'package:islami_c7_sat/home/hadeth/hadeth_title_widget.dart';

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
            : Column(
                children: [
                  Image.asset('assets/images/hadeth_header_image.png'),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (_, index) {
                          return HadethTitleWidget(allHadethItems[index]);
                        },
                        itemCount: allHadethItems.length,
                        separatorBuilder: (_, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            height: 1,
                            width: double.infinity,
                            color: Theme.of(context).accentColor,
                          );
                        }),
                  ),
                ],
              ));
  }

  void readHadethFile() async {
    List<HadethModel> allHadeth = [];
    var fileContent = await rootBundle.loadString('assets/files/ahadeth.txt');
    var allHadethContent = fileContent.trim().split("#");
    for (int i = 0; i < allHadethContent.length; i++) {
      String singleHadethConent = allHadethContent[i];
      var singlHadethLines = singleHadethConent.trim().split('\n');
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
