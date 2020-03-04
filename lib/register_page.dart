/* import 'package:flutter/material.dart';
//import 'package:share_taxi/src/home/views/home_screen.dart';
//import 'package:share_taxi/src/utils/common.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formState = GlobalKey();

  bool _loading = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: _buildBody(),
        ),
      );

  Widget _buildBody() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildHeader(),
            _buildForm(),
          ],
        ),
      );

  Widget _buildHeader() => Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Common.accentColor, Common.secondaryColor],
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70)),
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Share Taxi',
              style: Theme.of(context).textTheme.body1.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Common.primaryColor,
                  ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              /*child: Icon(
                Icons.local_taxi,
                color: Common.primaryColor,
                size: 40,
              ),*/
              child: Container(
                width: 50,
                height: 50,
                decoration:  BoxDecoration(
                  shape: BoxShape.rectangle,
                  image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/taxiIcon.png")
                  ),
                ),
              ),
            ),
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.body1.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Common.primaryColor,
                  ),
            ),
          ],
        ),
      );

  Widget _buildForm() => Expanded(
        child: Form(
          key: _formState,
          child: ListView(
            children: <Widget>[
              _buildText(),
              _buildPara(),
              _buildMobileNO(),
              _buildSubmit(),
            ],
          ),
        ),
      );

  // Widget _buildName() => Container(
  //       margin: EdgeInsets.only(top: 40, left: 30, right: 30),
  //       padding: EdgeInsets.symmetric(vertical: 5),
  //       decoration: BoxDecoration(
  //         color: Common.lightColor,
  //         borderRadius: BorderRadius.circular(30),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Common.mutedColor,
  //             blurRadius: 1,
  //           ),
  //         ],
  //       ),
  //       child: TextFormField(
  //         decoration: InputDecoration(
  //           contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
  //           hintText: 'Name',
  //         ),
  //         validator: (value) {
  //           if (value.isEmpty) {
  //             return 'Please enter your name';
  //           }
  //           return null;
  //         },
  //       ),
  //     );
  Widget _buildText() => Container(
    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
    padding: EdgeInsets.symmetric(vertical: 5),
        child: Text(
       'Your Number',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.body1.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Common.darkColor,
        ),
     ),
  );
       //please confirm your phone county code and enter your fhone number.
    Widget _buildPara() => Container(
    margin: EdgeInsets.only(top: 20, left: 30, right: 30),
    padding: EdgeInsets.symmetric(vertical: 5),
        child: Text(
       'Please confirm your phone county code and enter your phone number.',
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.body1.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Common.hintColor,
        ),
     ),
  );
  Widget _buildMobileNO() => Container(
        margin: EdgeInsets.only(top: 40, left: 30, right: 30),
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Common.lightColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Common.mutedColor,
              blurRadius: 1,
            ),
          ],
        ),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            hintText: 'mobile number',
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter your mobile number';
            }
            return null;//confirm number via sending code to the given number
          },
        ),
      );

  Widget _buildSubmit() => Container(
        margin: EdgeInsets.only(top: 40, left: 30, right: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Common.accentColor, Common.secondaryColor],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            _formState.currentState.validate();
            // setState(() {
            //   _loading = !_loading;
            // });
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AnimatedOpacity(
                opacity: _loading ? 0 : 1,
                duration: Duration(milliseconds: 500),
                child: Text(
                  'Submit',
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Common.primaryColor,
                      ),
                ),
              ),
              AnimatedOpacity(
                opacity: _loading ? 1 : 0,
                duration: Duration(milliseconds: 500),
                child: SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Common.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
 */