import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marketapp/main.dart';
import 'package:http/http.dart' as http;

var rr;
var h;

class PurchaseHistoryPage extends StatefulWidget {
  @override
  _PurchaseHistoryPageState createState() => _PurchaseHistoryPageState();
}

class _PurchaseHistoryPageState extends State<PurchaseHistoryPage> {
  List<String> historyitemslist = [];
  @override
  void initState() {
    super.initState();
    gethistory();
  }

  Future gethistory() async {
    var response = await http.post(
      Uri.parse(purchaseshistoryURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': "usernametemp",
      }),
    );
    setState(() {
      rr = json.decode(response.body);
      for (var i = 0; i < rr.length; i++) {
        historyitemslist.add(rr[i][2].toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: darkblue,
          title: Text("your purchase history",
              style: TextStyle(fontFamily: "ballon", fontSize: 30)),
        ),
        backgroundColor: lightblue,
        body: Container(
            child: ListView.builder(
          itemCount: historyitemslist.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: darkblue
              ),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Row(
              children: [Text("${historyitemslist[index]}" ,style: TextStyle(color: Colors.white , height: 1.5 , fontSize: 16),)],
            ),
            );
          },
        )));
  }
}
