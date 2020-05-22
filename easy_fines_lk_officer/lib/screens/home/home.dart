import 'package:flutter/material.dart';
import 'package:easy_fines_lk_officer/services/auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:easy_fines_lk_officer/screens/home/courtcases.dart';
import 'package:easy_fines_lk_officer/screens/home/fineshistory.dart';
import 'package:easy_fines_lk_officer/screens/add_fine.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final val = TextEditingController();

  final AuthService _auth = AuthService();
  DatabaseReference ref;

  void initState() {
    super.initState();
    ref = FirebaseDatabase.instance.reference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('My Dashboard'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.history), text: "Fines History"),
                Tab(
                  icon: Icon(Icons.account_balance),
                  text: "Court Cases",
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: Text("Name"),
                  decoration: BoxDecoration(color: Colors.blue),
                  accountEmail: Text("Officer's No."),
                  currentAccountPicture: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 50.0,
                    ),
                  ),
                ),
                Container(
                  height: 60.0,
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(child: Icon(Icons.person)),
                        Text("My Profile"),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  height: 60.0,
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Icon(Icons.settings),
                        ),
                        Text("Settings"),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    onTap: () {
                      //Navigator.pop(context, '/payment_settings');
                    },
                  ),
                ),
                Container(
                  height: 60.0,
                  child: InkWell(
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.exit_to_app),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 98.0),
                              child: Text("Logout")),
                        ],
                      ),
                      onTap: () {
                        _auth.signOut();
                      }),
                ),
                SizedBox(
                  height: 120,
                ),
                Container(
                  child: Image(
                    image: AssetImage('assets/Logo2.PNG'),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[new FinesHistory(), new CourtCases()],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // return showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       title: Text("Add a new fine"),
          //       content: new SingleChildScrollView(
          //         child: new Column(
          //           mainAxisSize: MainAxisSize.min,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: <Widget>[
          //             new TextFormField(
          //               keyboardType: TextInputType.number,
          //               decoration: InputDecoration(labelText: 'Enter Val'),
          //               controller: val,
          //             ),
          //             new RaisedButton(
          //               child: Text("Add"),
          //               color: Colors.blue[300],
          //               textColor: Colors.white70,
          //               onPressed: () {},
          //             )
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFineForm()),
          );
        },
        tooltip: 'Add a new fine',
        child: Icon(Icons.add),
      ),
    );
  }
}
