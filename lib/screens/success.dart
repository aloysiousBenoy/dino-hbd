import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:dinohdb/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  final ConfettiController _confetti =
      ConfettiController(duration: Duration(seconds: 5));

  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      setState(() {
        _confetti.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.deepOrange[100], Colors.amber[200]],
          )),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(alignment: AlignmentDirectional.center, children: [
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: ConfettiWidget(
                confettiController: _confetti,
                // blastDirection: pi / 2,
                // maxBlastForce: 5, // set a lower max blast force
                // minBlastForce: 2, // set a lower min blast force
                emissionFrequency: 0.05,
                numberOfParticles: 25, // a lot of particles at once
                // gravity: 1,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Happy Birthday luv,",
                    style: GoogleFonts.lobster().copyWith(fontSize: 30),
                  ),
                  Text(
                    "You are my sunshine, my only sunshine....",
                    style: content,
                  ),
                  Text(
                    "And I'm gonna love you like I'm gonna lose you.... ",
                    style:
                        content.copyWith(fontSize: 25, fontFamily: 'cursive'),
                  ),
                  Text("now time for the prize...... Its in your bag.."),
                ],
              ),
            )
          ])),
    );
  }
}
