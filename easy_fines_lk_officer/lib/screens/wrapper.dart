import 'package:easy_fines_lk_officer/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_fines_lk_officer/models/user.dart';
import 'package:easy_fines_lk_officer/screens/authenticate/authenticate.dart';
import 'package:easy_fines_lk_officer/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    print(user);

    //return either home or authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
