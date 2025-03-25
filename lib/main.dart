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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(70, 29, 124, 1)),
        useMaterial3: true,
      ),
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
        title: Text("PFT Scavenger Hunt", style: TextStyle(fontFamily: 'ProximaNova', fontWeight: FontWeight.w900, color: Color.fromRGBO(253, 208, 35, 1))),
        backgroundColor: Color.fromRGBO(70, 29, 124, 1),
      ),
      body: Center(
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
                style: TextStyle(fontFamily: 'ProximaNova', fontWeight: FontWeight.normal, fontSize: 17), 
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
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  List questions = ["If you're feeling hungry but can't go far to get a meal, you can always rely on Panera for good, healthy food. They have a microwave to heat up your lunch as well but there is one restriction. What food product can you not microwave?",
                    "When students are in need of a quick refreshment, they can head down the hallway to the vending machines. There’s a great selection of snacks and drinks. On the far left, students can conveniently grab a _____ or blue book if they forgot to get one before a test.",
                    "The RoyOMartin Auditorium honors Roy O. Martin Sr., the business pioneer and Martin family patriarch who grew a small sawmill in Alexandria, Louisiana into a leading lumber company. His family has continued his legacy, focusing on their core values. What is the acronym for the family’s values?",
                    "Whenever I need to speak to a counselor or need general advising,the student services center is the first place I think to go to. They can refer you to where you can get more specific information or give you advice regarding your degree audit or career. It is named after Dr. _____ A. _____.",
                    "The best view of the Capstone Gallery stairs is from the 2nd floor balcony. The banners above the stairs describe the common traits of a college of engineering student. The most common trait according to the banner is _____.",
                    "Walking around the 2nd floor, you can't miss this room with a full-sized sedan in it. In tandem with cameras, projectors, and screens, the Driving Simulation Lab is one of PFT's notable research facilities. The make of the car inside this room is a _____.",
                    "The Chevron Center is a welcoming facility for students to utilize at any time. It has a computer lab, 3D printer, poster services, and more. But you have to remember to sign in to log that its services are in use so that the center can be kept running. What is the name of the movie character that is reminding you to sign in at the front desk?",
                    "The engineering honor society is the only honor society that represents engineers across all disciplines. It was first founded in 1885 at Lehigh University. What is the name of the engineering honor society as described on the sculpture?",
                    "Patrick F. Taylor Hall was renovated and expanded to hold more state-of-the-art classrooms and labs for its students. The commemorative plaque lists the people who made the renovation possible. What year was the building renovation?",
                    "The College of Engineering would not be the department it is today without the contributions of past alumni and many others. The support from the founding members allows the education and cultivation of the best engineers and computer scientists as well as support for all faculty. Take a look at the inducted members. What is James Rutland's nickname?"];
  List answers = ["Seafood", "scantron", "RICHES", "William Brookshire", "Leader", "Ford", "Roz", "Tau Beta Pi", "2014", "Pepper"];
  List hints = ["Read the note on the microwave.", "No. 2 pencils only!", "Rags to _____ ?", "Who is the short biography about?", "Follow the _____ ?", "It rhymes with cord.", "Monsters, Inc. character", "First line on the sculpture’s placard", "11 years ago...", "A spicy vegetable like a jalapeño"];
  
  int cur = 0;
  final TextEditingController _controller = TextEditingController();
  String result = "";
  Color resultColor = Color.fromRGBO(60, 222, 79, 1);
  bool nextButton = false;
  bool hintButton = true;
  bool displayHint = false;

  void checkAnswer() {
    if (_controller.text.trim().toLowerCase() == answers[cur].toLowerCase()) {
      setState(() {
        result = "Correct!";
        resultColor = Color.fromRGBO(60, 222, 79, 1);
        nextButton = true;
        hintButton = false;
        displayHint = false;
      });
    }
    else {
      setState(() {
        result = "Wrong, try again.";
        resultColor = Color.fromRGBO(255, 69, 69, 1);
      });
    }
  }

  void getHint() {
    setState(() {
      displayHint = true;
    });
  }

  void getNext() {
    if (cur < questions.length - 1) {
      setState(() {
        cur++;
        result = "";
        _controller.clear();
        nextButton = false;
        hintButton = true;
        displayHint = false;
      });
    }
    else {
      cur = 0;
      result = "";
      _controller.clear();
      nextButton = false;
      hintButton = true;
      displayHint = false;
      Navigator.pushReplacementNamed(context, "/end");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PFT Scavenger Hunt", style: TextStyle(fontFamily: 'ProximaNova', fontWeight: FontWeight.w900, color: Color.fromRGBO(253, 208, 35, 1))),
        backgroundColor: Color.fromRGBO(70, 29, 124, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text("Question ${cur+1}", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Container(
              width: 550,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(questions[cur], style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
                ),
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
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Color.fromRGBO(70, 29, 124, 1)),
              ),
              child: Text("Check Answer", style: TextStyle(fontFamily: 'ProximaNova', fontSize: 18, color: Color.fromRGBO(253, 208, 35, 1))),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 20, color: resultColor)),
            SizedBox(height: 20),
            if (hintButton)
              ElevatedButton.icon(
                icon: Icon(Icons.lightbulb_outline_rounded, color: Color.fromRGBO(253, 208, 35, 1)),
                onPressed:() {
                  getHint();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color.fromRGBO(70, 29, 124, 1)),
                ),
                label: Text("Hint", style: TextStyle(fontFamily: 'ProximaNova', fontSize: 18, color: Color.fromRGBO(253, 208, 35, 1))),
              ),
            SizedBox(height: 20),
            if (displayHint)
              Text(hints[cur], style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            if (nextButton)
              ElevatedButton(
                onPressed: () {
                  getNext();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color.fromRGBO(253, 208, 35, 1),),
                ),
                child: Text("Next", style: TextStyle(fontFamily: 'ProximaNova', fontSize: 18, color: Color.fromRGBO(70, 29, 124, 1))),
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
        title: Text("PFT Scavenger Hunt", style: TextStyle(fontFamily: 'ProximaNova', fontWeight: FontWeight.w900, color: Color.fromRGBO(253, 208, 35, 1))),
        backgroundColor: Color.fromRGBO(70, 29, 124, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/lsu.png', scale: 1.8),
            SizedBox(height: 20),
            Container(
              width: 550,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Congratulations, you made it to the end of the tour!\n\nWe hope you enjoyed your tour and would like to see you again!\n\nGeaux Tigers!", 
                style: TextStyle(fontSize: 20), 
                textAlign: TextAlign.center),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/");
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