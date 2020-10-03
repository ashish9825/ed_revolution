import 'package:ed_revolution/paints/circle.dart';
import 'package:ed_revolution/paints/solid_circle.dart';
import 'package:ed_revolution/sections/homeSection/ui/dashboard.dart';
import 'package:ed_revolution/utils/constants.dart';
import 'package:ed_revolution/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFd2ecf9),
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: Color(0xFFd2ecf9),
        child: _loginBody(),
      ),
    );
  }

  Widget _loginBody() {
    return Stack(
      children: [
        Circle(
          center: {
            "x": SizeConfig.blockSizeHorizontal * 87,
            "y": SizeConfig.blockSizeVertical * 8
          },
          radius: SizeConfig.blockSizeHorizontal * 20,
          strokeWidth: SizeConfig.blockSizeHorizontal * 5,
          color: Color(0xFFbce2f6),
        ),
        Positioned(
          left: SizeConfig.screenWidth * 0.35,
          top: SizeConfig.screenHeight * 0.15,
          child: Container(
            height: SizeConfig.blockSizeVertical * 40,
            width: SizeConfig.blockSizeHorizontal * 60,
            child: Lottie.asset("assets/login_education.json"),
          ),
        ),
        Positioned(
          child: SolidCircle(
            center: {
              "x": SizeConfig.blockSizeHorizontal * 17,
              "y": SizeConfig.blockSizeVertical * 23
            },
            radius: SizeConfig.blockSizeHorizontal * 0.7,
            strokeWidth: SizeConfig.blockSizeHorizontal * 2.5,
            color: Color(0xFFFF7F98),
          ),
        ),
        Positioned(
          child: SolidCircle(
            center: {
              "x": SizeConfig.blockSizeHorizontal * 10,
              "y": SizeConfig.blockSizeVertical * 35
            },
            radius: SizeConfig.blockSizeHorizontal * 0.7,
            strokeWidth: SizeConfig.blockSizeHorizontal * 2.5,
            color: Color(0xFF1c0c59),
          ),
        ),
        Positioned(
          top: SizeConfig.blockSizeVertical * 7,
          left: SizeConfig.blockSizeHorizontal * 3,
          child: Container(
            width: SizeConfig.blockSizeHorizontal * 20,
            child: Image.asset("images/edr_logo.png"),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: SizeConfig.screenHeight * 0.5,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeConfig.blockSizeHorizontal * 13),
                topRight: Radius.circular(SizeConfig.blockSizeHorizontal * 13),
              ),
            ),
            child: _signInBody(),
          ),
        ),
      ],
    );
  }

  Widget _signInBody() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.blockSizeHorizontal * 10,
          SizeConfig.blockSizeVertical * 3,
          SizeConfig.blockSizeHorizontal * 10,
          0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign in',
            style: TextStyle(
                fontFamily: "Poppins-Medium",
                fontSize: SizeConfig.blockSizeHorizontal * 6),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 3,
          ),
          Text(
            'Mobile Number',
          ),
          TextFormField(
            controller: _phoneTextController,
            cursorColor: Colors.black,
            keyboardType: TextInputType.phone,
            style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
            maxLength: 10,
            decoration: numberTextDecoration.copyWith(
              prefixIcon: SizedBox(
                width: SizeConfig.blockSizeHorizontal * 5,
                child: Center(
                  child: Text(
                    '+91',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: SizeConfig.blockSizeHorizontal * 4),
                  ),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 1.4,
                  horizontal: SizeConfig.safeBlockHorizontal * 2.8),
              counter: Container(),
              fillColor: Colors.grey[200],
            ),
            validator: (value) {
              return validateMobile(value);
            },
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Text(
            'Password',
          ),
          TextFormField(
            controller: _passwordTextController,
            cursorColor: Colors.black,
            obscureText: true,
            style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
            decoration: numberTextDecoration.copyWith(
              contentPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical * 1.4,
                  horizontal: SizeConfig.safeBlockHorizontal * 2.8),
              counter: Container(),
              fillColor: Colors.grey[200],
            ),
            validator: (value) {
              return validateMobile(value);
            },
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 3,
          ),
          Builder(
            builder: (context) => InkWell(
              onTap: () {
                if (validateCredentials()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                } else {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Enter Valid Credentials !'),
                    ),
                  );
                }
              },
              child: Container(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 1.5),
                    child: Text(
                      'Let\'s Study',
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3.7,
                          color: Colors.white),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF1891ac),
                  borderRadius:
                      BorderRadius.circular(SizeConfig.blockSizeHorizontal * 2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 3.0,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'New User?',
                    style: TextStyle(
                        color: Colors.black, fontFamily: "Poppins-Medium"),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign up',
                        style: TextStyle(color: Color(0xFFFF7F98)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validateCredentials() {
    bool validated = false;

    if (_phoneTextController.text == "9893002006" &&
        _passwordTextController.text == "maggiedr") {
      validated = true;
    } else {
      validated = false;
    }

    return validated;
  }

  String validateMobile(String value) {
    //Indian Mobile Numbers are of 10 digits.
    if (value.length != 10) {
      return 'Mobile Number must be of 10 digits';
    } else {
      return null;
    }
  }
}
