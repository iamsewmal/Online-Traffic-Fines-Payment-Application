import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'dashboard_officer_page.dart';

/* void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
      ),
    ); */

void main() => runApp(EasyFinesLK());

class EasyFinesLK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /*  theme: ThemeData(
        primaryColor: Color(0xFF1f04cf), */
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF1f04cf),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: DashboardOfficerPage(),
    );
  }
}

//void main() => runApp(MaterialApp(home: Text('Hello World!')));
