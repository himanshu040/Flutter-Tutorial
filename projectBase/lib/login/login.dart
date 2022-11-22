import 'package:flutter/material.dart';
import 'package:projectbase/Screens/dashboard/dashboard.dart';
import 'package:projectbase/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child:Text(
                "LOGIN PAGE"
            ),
          ),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(

              onPressed: () {
                setLogin();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Dashboard()));
              },
              child: Text(
                  "LOGIN"
              ),

            ),
          ),
        ),
      ),
    );
  }
  void setLogin() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    perf.setString(LOGIN, "true");
    //  String? onboarding = perf.getString(ONBOARDING);
  }
}
