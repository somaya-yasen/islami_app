import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/tabs/quraan_tab/quraan.dart';
import 'package:islami/while_loading.dart';

class SuraDetails extends StatefulWidget {
  static const routeName = 'sura-details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> ayat = [];
  late SuraDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    loadSura();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_screen.png'))),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          args.suraName,
          style: Theme.of(context).textTheme.bodySmall,
        )),
        body: Container(
          margin: EdgeInsets.all(40),
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: ayat.isEmpty
              ? whileLoding()
              : ListView.builder(
                  itemBuilder: (_, index) => Text(
                    ayat[index],
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  itemCount: ayat.length,
                ),
        ),
      ),
    );
  }

  Future<void> loadSura() async {
    String sura =
        await rootBundle.loadString('assets/files/${args.index + 1}.txt');
    ayat = sura.split('\n\r');
    setState(() {});
  }
}
