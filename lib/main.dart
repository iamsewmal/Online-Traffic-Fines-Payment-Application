import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.lightBlue,
          appBar: AppBar(
            title: Text('This is a test run application'),
            backgroundColor: Colors.lightBlue[1000],
          ),
          body: Center(
            child: Image(
              image: AssetImage('images/Logo1.PNG'),
            ),
          ),
        ),
      ),
    );

//void main() => runApp(MaterialApp(home: Text('Hello World!')));
