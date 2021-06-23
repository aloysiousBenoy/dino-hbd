import 'package:dinohdb/constants.dart';
import 'package:dinohdb/screens/checkCode.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class Pico extends StatelessWidget {
  final String picoFileUrl =
      "https://drive.google.com/file/d/1sdWLdCUHdYmMhRR_FvcMC_OfbgrK8W4K/view?usp=sharing";
  final String circuitUrl =
      "https://drive.google.com/file/d/1uTs0V4OGa7vv8wDia18_jC2wohEG8p8b/view?usp=sharing";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: SweepGradient(colors: [
            Colors.blue[200],
            Colors.amber[100],
            Colors.blue[200]
          ], tileMode: TileMode.mirror)),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your next puzzle awaits you here.....",
                  style: content,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if ((await canLaunch(picoFileUrl))) {
                        launch(picoFileUrl);
                      }
                    },
                    child: Text("File for pico")),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Download the file and flash it onto the pico..... use the circuit given below and decode the outputs.\n if circuit is missing, ask!!! \n"),
                ElevatedButton(
                    onPressed: () async {
                      print("Launch circuit image uri");
                      if (await canLaunch(circuitUrl)) {
                        launch(circuitUrl);
                      }
                    },
                    child: Text("Download Circuit")),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: Passphrase(),
                              type: PageTransitionType.fade));
                    })
              ],
            ),
          )),
    );
  }
}
