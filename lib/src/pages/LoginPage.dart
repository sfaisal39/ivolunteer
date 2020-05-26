import 'package:flutter/material.dart';
import 'package:ivolunteer/src/models/LoginStatus.dart';
import 'package:ivolunteer/src/networks/ApiBaseHelper.dart';
import 'package:ivolunteer/src/values/AppColors.dart';
import 'package:ivolunteer/src/values/AppStrings.dart';
import 'package:ivolunteer/src/weidgets/utilities.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool isProgress = false;
TextEditingController myControllerEmail = TextEditingController();
TextEditingController myControllerPassword = TextEditingController();

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

void showInSnackBar(String value) {
  _scaffoldKey.currentState
      .showSnackBar(new SnackBar(content: new Text(value)));
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildEmailTF() {
      return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: 20.0, left: 30.0, bottom: 0.0, right: 30.0),
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              controller: myControllerEmail,
              cursorColor: Colors.black,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontFamily: 'Calibri',
              ),
              decoration: InputDecoration(
                  labelText: AppStrings.email,
                  labelStyle: TextStyle(
                    color: AppColors.HINT_COLOR,
                    fontFamily: 'Calibri',
                  ),
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
            margin: EdgeInsets.only(
                top: 10.0, left: 30.0, bottom: 0.0, right: 30.0),
            height: 60.0,
            child: TextField(
              controller: myControllerPassword,
              obscureText: true,
              cursorColor: Colors.black,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontFamily: 'Calibri',
              ),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(6, 6, 40, 6),
                  hintText: AppStrings.password,
                  labelStyle: TextStyle(color: AppColors.HINT_COLOR),
                  labelText: AppStrings.password,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          showInSnackBar("need to implement");
                        },
                        child: Text(AppStrings.forget,
                            style: TextStyle(
                              color: AppColors.PRIMARY_COLOR_DARK,
                              fontFamily: 'Calibri',
                            )),
                      ),
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

    Widget _buildLoginButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30.0, right: 30),
            height: 40.0,
            width: MediaQuery.of(context).size.width / 3,
            child: RaisedButton(
              onPressed: () {
                if (!myControllerEmail.text.isEmpty &&
                    !myControllerPassword.text.isEmpty)
                  onLogin(myControllerEmail.text, myControllerPassword.text);
                else
                  showInSnackBar('Value Can\'t Be Empty');

                print(
                    myControllerEmail.text + " : " + myControllerPassword.text);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0)),
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    gradient: new LinearGradient(
                        colors: [Color(0xFFF7C559), Color(0xFFFE8F3A)]),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.0,
                        offset: Offset(0, 1),
                      ),
                    ]),
                child: Container(
                  constraints:
                      const BoxConstraints(minWidth: 70.0, minHeight: 40.0),
                  // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppStrings.login,
                        style: textStyleLogin,
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
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
                width: 80,
                height: 60,
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
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myControllerEmail.dispose();
      myControllerPassword.dispose();
      super.dispose();
    }

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
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
                          _buildLoginButton(),
                        ],
                      ),
                    ],
                  )),
                  Center(
                    child: isProgress
                        ? CircularProgressIndicator(
                            backgroundColor: AppColors.PRIMARY_COLOR_DARK,
                          )
                        : Container(),
                  )
                ],
              ),
              padding: EdgeInsets.only(bottom: 30.0)),
        ),
      ),
    );
  }

  onLogin(String email, String pass) async {
    setState(() {
      isProgress = true;
    });

    LoginStatus res = await ApiBaseHelper.loginUser(email, pass);
    print("called: "+ res.toString());
    setState(() {
      isProgress = false;
    });
    if (res.result.status == 0)
      showInSnackBar(res.result.msg);
    else
      showInSnackBar(res.result.msg);
//    Fluttertoast.showToast(msg: "Hello ");

  }
}
