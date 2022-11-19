import 'package:flutter/material.dart';
import 'package:islami_c7_sat/suraDetails/sura_details.dart';

class SuraNameWidget extends StatelessWidget {
  String title;
  int index;

  SuraNameWidget(this.title, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsScreenArgs(index: index, name: title));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
