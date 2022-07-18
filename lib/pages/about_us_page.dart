import 'package:flutter/material.dart';
import 'package:marketapp/main.dart';






class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
          backgroundColor: darkblue,
          title:
              Text("About our programming team", style: TextStyle(fontFamily: "ballon", fontSize: 30)),
         
          
        ),
      backgroundColor: lightblue,
      body: 
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        
        Expanded(
          flex: 5,
          child: Image.asset('assets/images/10.png'),
        ),

        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children:[
                  Image.asset('assets/images/team1.png' ,height: 100,),
                  Text("Hossein Balouchestani"),
                  Text("Programmer"),
                  Text("Designer"),
                ]
              ),
              
            ],
          )
        ),
      ],
    )
      );
  ;
  }
}
