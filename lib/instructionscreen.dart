import 'package:flutter/material.dart';


class InstructionScreen extends StatelessWidget {
  const InstructionScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PFT Scavenger Hunt", style: TextStyle(fontFamily: 'ProximaNovaBlack', color: Color.fromRGBO(253, 208, 35, 1))),
        backgroundColor: Color.fromRGBO(70, 29, 124, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/engr_logo.png', scale: 1),
            SizedBox(height: 20),
            Container(
              width: 550,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("How to Play:", 
                style: TextStyle(fontSize: 20), 
                textAlign: TextAlign.center),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/game");
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color.fromRGBO(253, 208, 35, 1)),
                ),
              child: Text("Play Again", style: TextStyle(fontFamily: 'ProximaNova', fontSize: 18, color: Color.fromRGBO(70, 29, 124, 1))),
            ),
          ],
        ),
      ),
    );
  }
}