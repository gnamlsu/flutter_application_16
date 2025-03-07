import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App 6',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const HomeScreen(),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/game": (context) => const GameScreen(),
        "/end": (context) => const EndScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PFT Scavenger Hunt"),
        backgroundColor: Color.fromRGBO(255, 84, 84, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("PFT Scavenger Hunt", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/game");
              },
              child: Text("Start/Play", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  List questions = ["What?1", "What?2", "what?3"];
  List answers = ["Answer1", "answer2", "Answer 3"];
  
  int cur = 0;
  final TextEditingController _controller = TextEditingController();
  String result = "";
  bool nextButton = false;

  void checkAnswer() {
    if (_controller.text.trim().toLowerCase() == answers[cur].toLowerCase()) {
      setState(() {
        result = "Correct!";
        nextButton = true;
      });
    }
    else {
      setState(() {
        result = "Wrong, try again.";
      });
    }
  }

  void getNext() {
    if (cur < questions.length - 1) {
      setState(() {
        cur++;
        result = "";
        _controller.clear();
        nextButton = false;
      });
    }
    else {
      cur = 0;
      result = "";
      _controller.clear();
      nextButton = false;
      Navigator.pushReplacementNamed(context, "/end");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PFT Scavenger Hunt Game"),
        backgroundColor: Color.fromRGBO(255, 84, 84, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Question ${cur+1}", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(questions[cur], style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 400,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Enter your answer")
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:() {
                checkAnswer();
              },
              child: Text("Check Answer", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            if (nextButton)
              ElevatedButton(
                onPressed: () {
                  getNext();
                },
                child: Text("Next", style: TextStyle(fontSize: 18)),
              ),
          ],
        ),
      ),
    );
  }
}

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PFT Scavenger Hunt End Screen"),
        backgroundColor: Color.fromRGBO(255, 84, 84, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("PFT Scavenger Hunt", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/");
              },
              child: Text("Play Again", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}