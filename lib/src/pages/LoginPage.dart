import 'package:flutter/material.dart';
import 'package:ivolunteer/src/networks/ApiBaseHelper.dart';
import 'package:ivolunteer/src/values/AppColors.dart';
import 'package:ivolunteer/src/values/AppStrings.dart';
import 'package:ivolunteer/src/weidgets/utilities.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool isProgress = false;

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildEmailTF() {
    return Column(
      children: <Widget>[
        Text(
          AppStrings.email,
          style: kLabelStyle,
        ),
        Container(
          margin:
              EdgeInsets.only(top: 20.0, left: 30.0, bottom: 0.0, right: 30.0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            cursorColor: Colors.black,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontFamily: 'Calibri',
            ),
            decoration: InputDecoration(
                labelText: AppStrings.email,
                labelStyle: TextStyle(color: AppColors.HINT_COLOR),
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 00.0),
                  child: Icon(
                    Icons.mail_outline,
                    color: Colors.black,
                  ),
                )),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      children: <Widget>[
        Container(
          margin:
              EdgeInsets.only(top: 10.0, left: 30.0, bottom: 0.0, right: 30.0),
          height: 60.0,
          child: TextField(
            obscureText: true,
            cursorColor: Colors.black,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontFamily: 'Calibri',
            ),
            decoration: InputDecoration(
                hintText: AppStrings.password,
                labelStyle: TextStyle(color: AppColors.HINT_COLOR),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text("Forget",
                        style: TextStyle(
                          color: AppColors.PRIMARY_COLOR_DARK,
                        )),
                  ),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 00.0),
                  child: Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                )),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 100.0),
          Container(
              width: 90,
              height: 65,
              margin: EdgeInsets.only(left: 30.0, top: 20.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/user.png',
                    )),
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 30.0, top: 20.0),
            child: Text(
              AppStrings.Welcome,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.BLACK_COLOR),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 30.0, top: 0.0),
            child: Text(
              AppStrings.Singin_to_cont,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: AppColors.GREY_COLOR),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController myControllerEmail = TextEditingController();
    TextEditingController myControllerPassword = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myControllerEmail.dispose();
      myControllerPassword.dispose();
      super.dispose();
    }

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {

          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          height: height,
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                      child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          _buildLogo(),
                          _buildEmailTF(),
                          _buildPasswordTF(),
                        ],
                      ),
                    ],
                  )),
//          Center(
//            child: isProgress ? CircularProgressIndicator() : Container(),
//          )
                ],
              ),
              padding: EdgeInsets.only(bottom: 30.0)),
        ),
      ),
    );
  }

  onLogin(String email, String pass) {
    setState(() {
      isProgress = true;
    });

    ApiBaseHelper.loginUser(email, pass);
    setState(() {
      isProgress = false;
    });
  }
}
