/* import 'package:flutter/material.dart';
//import 'package:share_taxi/src/home/views/home_screen.dart';
//import 'package:share_taxi/src/register/views/register_screen.dart';
//import 'package:share_taxi/src/utils/common.dart';

class LoginScreen extends StatefulWidget{
  State<StatefulWidget> createState() => LoginScreenState();
  }
  
  class LoginScreenState extends State<LoginScreen> {
    GlobalKey<FormState> _formState = GlobalKey();

    bool _loading = false;

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
          colors: [Common.accentColor,Common.secondaryColor],
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
            'Login',
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
            _buildUserName(),
            _buildPassword(),
            _buildLogin(),
            _buildFogetPassword(),
            _buildText(),
            _buildLoginWithFB(),
            _biildSingUpText()
          ],
        ),
      ),
    );

    Widget _buildUserName() => Container(
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
          hintText: 'User name or email',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter user name or email';
          }
            return null;
        },
      ),
    );

    Widget _buildPassword() => Container(
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
          hintText: 'Password',
        ),
        keyboardType: TextInputType.text,
        obscureText: true,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter your Password';
          }
            return null;
        },
      ),
    );

    Widget _buildLogin() => Container(
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
          // }
          // );
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
              'Login'.toUpperCase(),
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

    Widget _buildFogetPassword() => Container(
      margin: EdgeInsets.only(top: 10, right:30),
      alignment: Alignment.centerRight,
      child: GestureDetector(
       child: Text(
         'Fogot Password?',
          style: Theme.of(context).textTheme.body1.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Common.accentColor
          ),
       ),
       onTap: (){
         //TO DO: redirect to "enter email" page
        // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),
        // );
       },
      ),
    );

    Widget _buildText() => Container(

    );

    Widget _buildLoginWithFB() => Container(
      margin: EdgeInsets.only(top: 40, left: 30, right: 30),
      decoration: BoxDecoration(
        color: Common.secondaryColor,
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
          // }
          // );
          // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginFBPage()),
        // );
        },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedOpacity(
            opacity: _loading ? 0 : 1,
            duration: Duration(milliseconds: 500),
            child: Text(
              'Login With facebook',
               style: Theme.of(context).textTheme.body1.copyWith(
                fontSize: 15,
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

    Widget _biildSingUpText() => Container(
      margin: EdgeInsets.only(top: 10, right:30),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        child: Text(
         "Don't have an account?"+"signup".toUpperCase(),
          style: Theme.of(context).textTheme.body1.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Common.accentColor
          ),
        ),
        onTap: (){
          //TO DO: redirect to signup page
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()),
        );
        },
      ),
    );  
} */