import 'dart:async';

import 'package:dinohdb/screens/picofile.dart';
import 'package:dinohdb/screens/success.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final int max_items = 15;

  ScrollController _scroll = ScrollController();

  Widget builditem(Size size, int index) {
    int random = index + 1;
    // int random = Random().nextInt(13);
    if (random < 1) random = 1;
    if (random > max_items) {
      return Container(
        child: Center(
          child: IconButton(
            iconSize: 30,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: Success(), type: PageTransitionType.fade));
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
        ),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey[200], Colors.yellow[100]],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }

    String asset = "assets/$random.jpg";
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(asset),
            fit: BoxFit.cover,
          )),
    );
  }

  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      print("Starting autoscroll");
      if (this.mounted) _scroll.jumpTo(_scroll.position.minScrollExtent);

      _scroll.animateTo(_scroll.position.maxScrollExtent,
          duration: Duration(seconds: 10), curve: Curves.bounceOut);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "I dunno why I made this screen, but hey... here it is ",
          style: TextStyle(color: Colors.black45),
        ),
        backgroundColor: Colors.yellow[100],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.grey[400], Colors.yellow[100]])),
          child: GridView.count(
            controller: _scroll,
            crossAxisCount: 2,
            children: List.generate(
              max_items + 1,
              (index) => builditem(MediaQuery.of(context).size, index),
            ),
          )),
    );
  }
}
