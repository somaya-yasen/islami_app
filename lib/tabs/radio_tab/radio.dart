import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  static const String routeName = 'Radio';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
        child: Column(children: [
          Image.asset(
            'assets/images/radio_image.png',
          ),
          Text('إذاعة القرآن الكريم',
              style: Theme.of(context).textTheme.bodyLarge),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Image.asset(
              'assets/images/radio_sound.png',
            ),
          ),
        ]),
      ),
    );
  }
}
