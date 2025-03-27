import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("PFT Scavenger Hunt", style: TextStyle(fontFamily: 'ProximaNovaBlack', color: Color.fromRGBO(253, 208, 35, 1))),
        backgroundColor: Color.fromRGBO(70, 29, 124, 1),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Image.asset('lib/assets/pft.png', scale: 3.5),
              SizedBox(height: 20),
              Container(
                width: 550,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Welcome to the PFT Scavenger Hunt!\n\nYou will take a short yet interactive tour to some notable locations in Patrick F. Taylor Hall.\n\nEach location will have an associated question that you must answer correctly to move on to the next location of the tour. To find the answer, you may have to look around and read some of the plaques hanging around. Some answers may be right in front of you, so look closely!\n\nThe answers are not case-sensitive, and you can use hints to help you.\n\nThe goal is to make learning about and navigating PFT hall fun and engaging. We hope you enjoy!", 
                  style: TextStyle(fontFamily: 'ProximaNova', fontSize: 17), 
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
                child: Text("Start", style: TextStyle(fontFamily: 'ProximaNova', fontSize: 18, color: Color.fromRGBO(70, 29, 124, 1))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}