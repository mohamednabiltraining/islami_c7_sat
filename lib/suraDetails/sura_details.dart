import 'package:flutter/material.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'sura-details';

  @override
  Widget build(BuildContext context) {
    SuraDetailsScreenArgs args =
        (ModalRoute.of(context)?.settings.arguments) as SuraDetailsScreenArgs;
    // print(args.name);
    //print(args.index);
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/main_background.png'))),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.name),
          ),
        ));
  }
}

class SuraDetailsScreenArgs {
  int index;
  String name;

//  SuraDetailsScreenArgs(this.index, this.name);
  SuraDetailsScreenArgs({required this.index, required this.name});
}
