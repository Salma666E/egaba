import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Score.dart';

class Home extends StatefulWidget {
  const Home(this.isDarkTheme);
  final bool isDarkTheme;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final firestoreInstance = FirebaseFirestore.instance;
  int i = 0;
  List quiz = [];
  bool selectedVal = false;
  List score = [];
  @override
  void initState() {
    super.initState();
    score.add(0);
    firestoreInstance.collection("quiz").get().then((querySnapshot) {
      setState(() {
        quiz = querySnapshot.docs;
        print(quiz.length);
      });
    });
  }

  
  @override
  Widget build(BuildContext context) {
    ButtonStyle bs = widget.isDarkTheme?TextButton.styleFrom(
    backgroundColor: Colors.teal[300],
  ):TextButton.styleFrom(
    backgroundColor: Colors.blue[300],
  );
    print(widget.isDarkTheme);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 5.0),
          child: quiz.isNotEmpty
              ? Stack(
                  textDirection: TextDirection.ltr,
                  alignment: Alignment.bottomRight,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(quiz[i]["q"].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: widget.isDarkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 22)),
                        SizedBox(
                          height: 10,
                          width: double.infinity,
                        ),
                        TextButton(
                          style:bs,
                          onPressed: () {
                            checkAnwser(quiz[i]["a"][0].toString());
                          },
                          child: Text(
                            quiz[i]["a"][0].toString(),
                            style: TextStyle(
                                color: widget.isDarkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 18),
                          ),
                        ),
                        TextButton(
                          style:bs,
                          onPressed: () {
                            checkAnwser(quiz[i]["a"][1].toString());
                          },
                          child: Text(
                            quiz[i]["a"][1].toString(),
                            style: TextStyle(
                                color: widget.isDarkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 18),
                          ),
                        ),
                        TextButton(
                          style:bs,
                          onPressed: () {
                            checkAnwser(quiz[i]["a"][2].toString());
                          },
                          child: Text(
                            quiz[i]["a"][2].toString(),
                            style: TextStyle(
                                color: widget.isDarkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 18),
                          ),
                        ),
                        TextButton(
                          style:bs,
                          onPressed: () {
                            checkAnwser(quiz[i]["a"][3].toString());
                          },
                          child: Text(
                            quiz[i]["a"][3].toString(),
                            style: TextStyle(
                                color: widget.isDarkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: FloatingActionButton(
                        child: Icon(Icons.arrow_back),
                        onPressed: () {
                          if (i > 0 && i <= quiz.length) {
                            setState(() {
                              --i;
                            });
                            if (selectedVal) {
                              score.removeLast();
                              score.removeLast();
                            } else {
                              score.removeLast();
                            }
                            print("Previous" + i.toString());
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(
                    semanticsLabel: 'Lodding',
                  ),
                ),
        ),
      ),
    );
  }

  void checkAnwser(String ans) {
    if (ans == quiz[i]["ans"]) {
      score.add(quiz[i]["score"]);
    }
    setState(() {
      selectedVal = true;
    });
    // /////////////////////
    if (i < quiz.length - 1) {
      if (selectedVal) {
        setState(() {
          ++i;
        });
        print("Next" + i.toString());
      } else {
        Fluttertoast.showToast(
            msg: "You must select the item before entering the next!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      int S = 0;
      for (var i = 0; i < score.length; i++) S += score[i] as int;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Score(S.toString())),
      );
    }
  }
}
