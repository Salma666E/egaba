import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class Welcome extends StatefulWidget {
  const Welcome({
    this.isDarkTheme = false,
    this.onThemeChanged = _dummyOnFocusChange,
  });

  final bool isDarkTheme;
  final ValueChanged<bool> onThemeChanged;
  static dynamic _dummyOnFocusChange(bool val) {}
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 18.0, bottom: 8.0, right: 10.0, left: 32.0),
            child: Text(
              "Welcome to the agaba app...",
              style: TextStyle(
                  color: widget.isDarkTheme ? Colors.white : Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),
        ),
        SizedBox(height: 30,width: double.infinity
        ,),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: ListTile(
            title: Text("Select Your Mode?",
                style: TextStyle(
                  color: widget.isDarkTheme ? Colors.white : Colors.black,
                )),
            trailing: new IconButton(
              icon: widget.isDarkTheme
                  ? Transform.rotate(
                      angle: .55,
                      child: Icon(
                        Icons.brightness_3,
                        size: 20.0,
                      ))
                  : Icon(Icons.brightness_7),
              onPressed: () {
                setState(() {
                  widget.onThemeChanged(!widget.isDarkTheme);
                });
                print("widget.isDarkTheme: " + widget.isDarkTheme.toString());
              },
              tooltip: 'Switch brightness',
            ),
          ),
        ),
        SizedBox(height: 30,width: double.infinity
        ,),
        ElevatedButton(
          child: Text('Enter To Start The Quiz'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home(widget.isDarkTheme)),
            );
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(widget.isDarkTheme?Colors.teal[300]:Colors.blue[300]),
              padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
        ),
      ]),
    );
  }
}
