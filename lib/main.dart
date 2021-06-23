import 'dart:async';

import 'package:dinohdb/constants.dart';
import 'package:dinohdb/screens/picofile.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MaterialApp(
    // home: Home(),
    routes: {
      "/": (context) {
        return Home();
      },
      "/test": (context) => Home2(),
      "/pico": (context) => Pico()
    },
  ));
}

class Home2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Work in progress..... come back later will ya...\n or maybe go check out my twitter @aloysiousbenoy",
              style: content,
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[100],
        title: Text(
          "©️ All rights reserved @ Moonga Gang , 2021",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _showMessage
                  ? "wait for it, dont scroll away"
                  : "Hello my dear kutti moongaa....",
              style: content,
            ),
            _showMessage
                ? Container()
                : IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () async {
                      print("Icon button pressed");
                      setState(() {
                        _showMessage = true;
                      });
                      Timer(Duration(milliseconds: 500), () async {
                        await Navigator.pushNamed(
                          context,
                          "/pico",
                        );
                        setState(() {
                          _showMessage = false;
                        });
                      });
                    })
          ],
        ),
      ),
    );
  }
}
