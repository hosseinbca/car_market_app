import 'dart:html';
import 'dart:ui';
import 'custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:marketapp/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool checksignin() {
    if (email.text.length >= 8 &&
        email.text.length <= 35 &&
        password.text.length >= 4 &&
        password.text.length <= 15) {
      return true;
    } else {
      result = "You entered invalid values!";
      return false;
    }
  }

  Future signintodatabase() async {
    var response = await http.post(
      Uri.parse(signinURL),
      headers: <String, String>{
        'useremail-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email.text,
        'password': password.text,
      }),
    );
    setState(() {
      result = response.body;
      if (!result.contains("email or password is incorrect!")) {
        useremail = email.text;
        Navigator.pushReplacementNamed(context, '/home');
      } 
    });
  }

  @override
  void initState() {
    result = "";
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkblue,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/5.png',
                ),
              ),
              flex: 2,
            ),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        result,
                        style: TextStyle(fontSize: 15, color: Colors.red),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome to",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "car market",
                          style: TextStyle(
                              fontFamily: "ballon",
                              fontSize: 50,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CustomTextField(
                          email, false, "", "email", Icons.person_rounded),
                      CustomTextField(password, true, "", "password",
                          Icons.vpn_key_rounded),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (checksignin()) {
                            signintodatabase();
                          } else {
                            setState(() {
                              result = "You entered invalid values!";
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(bottom: 4),
                          alignment: Alignment.center,
                          child: Text(
                            "signin",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(35)),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New User?  ",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                "Signup",
                                style: TextStyle(color: orange, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                       Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/home');
                              },
                              child: Text(
                                "Home",
                                style: TextStyle(color: orange, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      )
                    
                    ],
                  ),
                ))
          ]),
    );
  }
}
