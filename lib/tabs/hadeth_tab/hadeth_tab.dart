import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/hadeth_tab/hadeth.dart';
import 'package:islami/tabs/hadeth_tab/hadeth_details.dart';

class HadethTab extends StatefulWidget {
  static const String routeName = 'Hadeth';

  @override
  State<HadethTab> createState() => _HadethState();
}

class _HadethState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext) {
    if (ahadeth.isEmpty) {
      loadAhadeth();
    }
    return Column(
      children: [
        Image.asset(
          'assets/images/hadeth_logo.png',
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: Center(
          child: ListView.separated(
            separatorBuilder: (_, __) => SizedBox(
              height: 20,
            ),
            itemCount: ahadeth.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                  HadethDetails.routeName,
                  arguments: ahadeth[index]),
              child: Text(
                ahadeth[index].title,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )),
      ],
    );
  }

  Future<void> loadAhadeth() async {
    String ahadehtFiles =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethText = ahadehtFiles.split('#');
    ahadeth = ahadethText.map(
      (hadethText) {
        List<String> hadethLines = hadethText.trim().split('\n');
        String title = hadethLines.first;
        hadethLines.removeAt(0);
        List<String> content = hadethLines;
        return Hadeth(title: title, content: content);
      },
    ).toList();

    setState(() {});
  }
}
