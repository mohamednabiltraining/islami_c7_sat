import 'package:flutter/material.dart';

class TasbehTab extends StatefulWidget {
  static const String routeName = 'Sebha tap';
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int Tasbeh_count = 0;

  int round_number = 0;

  String Tasbeh_text = 'سبحان الله';

  double sebha_angle = 0;

  @override
  Widget build(BuildContext context) {
    var mediaQue = MediaQuery.of(context).size;
    return Container(
      width: mediaQue.width,
      child: Column(
        children: [
          Container(

            width: mediaQue.width,
            height: mediaQue.height * 0.38,
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                       "assets/images/head_of_seb7a.png",
                      height: mediaQue.height * 0.11),
                  left: mediaQue.width * 0.46,
                ),
                Positioned(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(150),
                    onTap: () {
                      Tasbeh_count++;
                      if (round_number == 0) {
                        Tasbeh_text = 'سبحان الله';
                        if (Tasbeh_count == 34) {
                          Tasbeh_count = 1;
                          round_number = 1;
                          Tasbeh_text = 'الحمد الله';
                        }
                      } else if (round_number == 1) {
                        Tasbeh_text = 'الحمد الله';
                        if (Tasbeh_count == 34) {
                          Tasbeh_count = 1;
                          round_number = 2;
                          Tasbeh_text = 'الله اكبر';
                        }
                      } else if (round_number == 2) {
                        Tasbeh_text = 'الله اكبر';
                        if (Tasbeh_count == 34) {
                          Tasbeh_count = 1;
                          round_number = 0;
                          Tasbeh_text = 'سبحان الله';
                        }
                      } else {
                        Tasbeh_count = 0;
                      }
                      sebha_angle += 12;
                      setState(() {});
                    },
                    child: Transform.rotate(
                        angle: sebha_angle,
                        child: Image.asset(
                           "assets/images/body of seb7a.png",
                          width: mediaQue.width * 0.5,
                        )),
                  ),
                  top: 65,
                  left: mediaQue.width * 0.25,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  blurStyle: BlurStyle.normal,
                  offset: Offset.zero,
                  spreadRadius: 0,
                ),
              ],
            ),
            padding: const EdgeInsets.all(15),
            child: Text(
              "$Tasbeh_count",
              style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).primaryColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  blurStyle: BlurStyle.normal,
                  offset: Offset.zero,
                  spreadRadius: 0,
                ),
              ],
            ),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: Text(
              Tasbeh_text,
              style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold ,fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
