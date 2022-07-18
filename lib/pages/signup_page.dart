import 'package:flutter/material.dart';
import 'custom_widgets/custom_text_field.dart';
import 'package:marketapp/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool checksignup() {
    if (email.text.length >= 8 &&
        email.text.length <= 35 &&
        password.text.length >= 4 &&
        password.text.length <= 15 &&
        name.text.length > 2 &&
        name.text.length <= 15 &&
        family.text.length > 2 &&
        family.text.length <= 20) {
      return true;
    } else {

      return false;
    }
  }

  Future signuptodatabase() async {
    var response = await http.post(
      Uri.parse(SignupURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email.text,
        'password': password.text,
        'name': name.text,
        'familyname': family.text,
      }),
    );
    setState(() {
      result = response.body;
      print(response.body);
      if (!result.contains("This username is taken! try another")) {
        Navigator.pushReplacementNamed(context, '/home');
        useremail = email.text;
      } 
    });
  }

  @override
  void initState() {
    result = "";
    email = TextEditingController();
    name = TextEditingController();
    family = TextEditingController();
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
                    'assets/images/4.png',
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                  flex: 4,
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
                        CustomTextField(
                            name, false, "", "name", Icons.badge_rounded),
                        CustomTextField(
                            family, false, "", "family", Icons.badge_rounded),
                        CustomTextField(
                            email, false, "", "email", Icons.person),
                        CustomTextField(password, true, "", "password",
                            Icons.vpn_key_rounded),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (checksignup()) {
                              signuptodatabase();
                            }
                            else{
                              setState(() {
      result = "You entered invalid values!";
                                
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 4),
                            alignment: Alignment.center,
                            child: Text(
                              "signup",
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
                        /*
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Text("home"),
                      ),
                      */
                        Expanded(
                          child: SizedBox(),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Alredy Have Account?  ",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                child: Text(
                                  "Signin",
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
            ]));
  }
}
