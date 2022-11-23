import 'package:flutter/material.dart';
import 'package:islami_c7_sat/hadethDetails/hadeth_details.dart';
import 'package:islami_c7_sat/home/hadeth/hadeth_model.dart';

class HadethTitleWidget extends StatelessWidget {
  HadethModel hadeth;

  HadethTitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: hadeth);
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          hadeth.title,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
