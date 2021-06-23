import 'package:dinohdb/screens/hint1.dart';
import 'package:dinohdb/screens/success.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Passphrase extends StatelessWidget {
  final TextEditingController _passphrase = TextEditingController();
  final String _pass = "my one and only moonga";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.amber[100], Colors.white])),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Cracked the code?? Gimme the code..... come on, or you're going nowhere."),
            Container(
              width: 500,
              child: TextField(
                controller: _passphrase,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_pass.toLowerCase() == _passphrase.text.toLowerCase()) {
                    print("Match!!!");
                    Navigator.push(
                        context,
                        PageTransition(
                            child: Welcome(), type: PageTransitionType.fade));
                  } else {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: WrongCode(), type: PageTransitionType.fade));
                  }
                },
                child: Text("Check"))
          ],
        ),
      ),
    );
  }
}

class WrongCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.amber[100], Colors.white])),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Try again, I know you can do better.",
              style: GoogleFonts.monoton().copyWith(fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
