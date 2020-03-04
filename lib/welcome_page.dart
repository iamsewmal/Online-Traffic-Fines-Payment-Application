import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f04cf),
      body: Center(
        child: const Card(
          child: Image(
            image: AssetImage('images/Logo2.PNG'),
          ),
        ),
      ),
    );
  }
}

/* void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.indigo[900],
          /* appBar: AppBar(
            title: Text('This is a test run application'),
            backgroundColor: Colors.lightBlue[1000],
          ), */
          body: Center(
            child: Card(
              child: Image(
                image: AssetImage('images/Logo2.PNG'),
              ),
            ),
          ),
        ),
      ),
    ); */
