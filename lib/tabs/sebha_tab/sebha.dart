import 'package:flutter/material.dart';

class Sebha extends StatefulWidget {
  static const String routeName = 'Sebha';

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  double rotationAngle = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              count();
              setState(() {});
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedRotation(
                    turns: rotationAngle,
                    duration: Duration(seconds: 1),
                    child: Column(children: [
                      Image.asset('assets/images/allsebha.png',
                          height: MediaQuery.of(context).size.height * 0.4),
                    ])),
                Text('عدد التسبيحات',
                    style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: 20),
                Container(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      )),
                  child: Text('$counter',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(24)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )), // Set the border radius
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    count();
                  },
                  child: Text(
                    '$content',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  int counter = 1;

  String content = 'سبحان الله';

  List<String> tasbeh = [
    'سبحان الله',
    'الحمدلله',
    'الله اكبر',
    'لا اله الا الله'
  ];

  void onClickFunc() {
    if (counter < 33) {
      content = tasbeh[0];
    } else if (counter < 66) {
      content = tasbeh[1];
    } else if (counter < 99) {
      content = tasbeh[2];
    }
    rotationAngle += 0.01;
  }

  void count() {
    if (counter >= 99) {
      counter = 1;
      return;
    }
    setState(() {
      onClickFunc();
      counter++;
    });
  }
}
