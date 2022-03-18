import 'package:flutter/material.dart';
import 'Splash.dart';

class Score extends StatefulWidget {
  const Score(this.totalScore);

  final String totalScore;

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text('Your Score Is ${widget.totalScore} !!'),
              ),
              Container(
                child: Text("You are ... !!"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Splash()),
                                );
                },
                child: new Text("Restart The App", style: TextStyle(color: Colors.blue),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
