import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_button.dart';

const activeButtonColour = Color(0xFF1813ad);
const inactiveButtonColour = Color(0xFF2471e3);
const emptyContainerHeight = 20.0;
const emptyContainerMargin = EdgeInsets.all(20.0);

class DashboardOfficerPage extends StatefulWidget {
  @override
  _DashboardOfficerPageState createState() => _DashboardOfficerPageState();
}

class _DashboardOfficerPageState extends State<DashboardOfficerPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: /* AppBar(
        title: Text('Dashboard'),
      ), */
          AppBar(
        elevation: 10.0,
        centerTitle: true,
        //backgroundColor: Colors.white,
        leading: GestureDetector(
          child: const Icon(
            Icons.menu,
            //color: Colors.black,
          ),
          onTap: () {
            //_menuController.openMenu(true);
          },
        ),
        title: Text(
          'Dashboard',
          //style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              //color: Colors.black,
              size: 30.0,
            ),
            onPressed: () => (context),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: emptyContainerMargin,
            width: double.infinity,
            height: emptyContainerHeight,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('Add button just pressed.');
                    },
                    child: ReusableButton(
                      colour: inactiveButtonColour,
                      buttonChild: IconContent(
                        icon: FontAwesomeIcons.plusCircle,
                        label: 'Create a Fine',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableButton(
                    colour: inactiveButtonColour,
                    buttonChild: IconContent(
                      icon: FontAwesomeIcons.history,
                      label: 'History',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableButton(
                    colour: inactiveButtonColour,
                    buttonChild: IconContent(
                      icon: FontAwesomeIcons.balanceScale,
                      label: 'Court Cases',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableButton(
                    colour: inactiveButtonColour,
                    buttonChild: IconContent(
                      icon: FontAwesomeIcons.clipboardList,
                      label: 'My Fines',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: emptyContainerMargin,
            width: double.infinity,
            height: emptyContainerHeight,
          ),
        ],
      ),
    );
  }
}
