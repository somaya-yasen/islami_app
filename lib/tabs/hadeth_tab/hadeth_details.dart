import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/tabs/hadeth_tab/hadeth.dart';
import 'package:islami/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami/tabs/quraan_tab/quraan.dart';
import 'package:islami/while_loading.dart';

class HadethDetails extends StatefulWidget {
  static const routeName = 'hadeth-details';

  @override
  State<HadethDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<HadethDetails> {
  List<String> ahadeth = [];
  //late HadethDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    //loadSura();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_screen.png'))),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
            hadeth.title,
            style: Theme.of(context).textTheme.bodySmall,
        ),
        
        ),
        body: Container(
          margin: EdgeInsets.all(40),
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
           child: hadeth.content.isEmpty
              ? whileLoding()
              : ListView.builder(
                  itemBuilder: (_, index) => Text(
                   hadeth.content[index],
                   style: Theme.of(context).textTheme.bodySmall,
                 textAlign: TextAlign.center,
                ),
                 itemCount: hadeth.content.length,
               ),
        ),
      ),
    );
  }


}
