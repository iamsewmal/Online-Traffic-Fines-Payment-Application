import 'dart:async';


import 'package:easy_fines_lk_officer/screens/wrapper.dart';
import 'package:flutter/material.dart';

import 'authenticate/authenticate.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Wrapper()));
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Colors.blueAccent,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Logo2.PNG'), alignment: Alignment.center),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
        ),
      ),
    );
  }
}
