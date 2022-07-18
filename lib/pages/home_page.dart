import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marketapp/main.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:html';
import 'package:icon_badge/icon_badge.dart';
import 'package:marketapp/pages/cars.dart';

var currentindex = 0;
double total_price = 0;
List<carsclass> cartitemslist = [];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentpage = 1;
  changepage(var i) {
    setState(() {
      currentpage = i;
    });
  }

  AppBar homeappbar(int page) {
    switch (page) {
      case 1:
        return AppBar(
          backgroundColor: darkblue,
          title:
              Text("hi", style: TextStyle(fontFamily: "ballon", fontSize: 30)),
          actions: [
            TextButton(
                onPressed: () {
                  useremail = "";
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  "Log out",
                  style: TextStyle(color: Colors.red),
                )),
          ],
          automaticallyImplyLeading: false,
        );
      case 2:
        return AppBar(
          backgroundColor: darkblue,
          title: Text("your shopping cart",
              style: TextStyle(fontFamily: "ballon", fontSize: 30)),
          actions: [
            TextButton(
                onPressed: () {
                  //Navigator.pushNamed(context, '/purchase_history');
                },
                child: Text("Previous purchases")),
          ],
          automaticallyImplyLeading: false,
        );
      default:
        return AppBar(
          backgroundColor: darkblue,
          title: Text("Car Market",
              style: TextStyle(fontFamily: "ballon", fontSize: 30)),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about_us');
                },
                child: Text(
                  "about us",
                  style: TextStyle(color: Colors.white),
                )),
            TextButton(
                onPressed: () {
                  useremail = "";
                  Navigator.pushReplacementNamed(context, '/signin');

                  exit(0);
                },
                child: Text(
                  "exit",
                  style: TextStyle(color: Colors.white),
                )),
          ],
          automaticallyImplyLeading: false,
        );
    }
  }

  Widget homepage(int page) {
    switch (page) {
      case 1:
        return Container(
            child: ListView.builder(
                itemCount: marketitemslist.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: cartscolor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                              spreadRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        marketitemslist[index].image,
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(marketitemslist[index].name),
                            Text(marketitemslist[index].model),
                            Text("${marketitemslist[index].price}"),
                            Text(marketitemslist[index].about)
                          ],
                        ),
                        Expanded(child: Container()),
                        IconButton(
                            iconSize: 35,
                            color: orange,
                            onPressed: () {
                              setState(() {
                                cartitemslist.add(marketitemslist[index]);
                                total_price += marketitemslist[index].price;
                              });
                            },
                            icon: Icon(Icons.add_shopping_cart_outlined)),
                      ],
                    ),
                  );
                }));
      case 2:
        return SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Container(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cartitemslist.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          height: 80,
                          decoration: BoxDecoration(
                            color: cartscolor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                  spreadRadius: 1)
                            ],
                          ),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          width: 400,
                          child: Row(
                            children: [
                              cartitemslist[index].image,
                              SizedBox(
                                width: 10,
                              ),
                              Text("${cartitemslist[index].name}"),
                              SizedBox(
                                width: 10,
                              ),
                              Text("${cartitemslist[index].model}"),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 20),
                                child: Text("${cartitemslist[index].price}"),
                              )),
                              IconButton(
                                  color: Colors.red[900],
                                  onPressed: () {
                                    setState(() {
                                      total_price -= cartitemslist[index].price;
                                      cartitemslist
                                          .remove(cartitemslist[index]);
                                    });
                                  },
                                  icon: Icon(Icons.remove_shopping_cart)),
                            ],
                          ),
                        );
                      })),
            ],
          ),
        );
      default:
        return accountpage;
    }
  }

  Future buy() async {
    String purchases = "";
    for (var car in cartitemslist) {
      purchases += "${car.name}  ${car.model}  \n";
    }
    purchases += "Total price :  $total_price  Dollar";
    var response = await http.post(
      Uri.parse(shoppingURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': useremail,
        'purchases': purchases,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeappbar(currentpage),
      backgroundColor: lightblue,
      body: Column(
        children: [
          Expanded(child: homepage(currentpage)),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: darkblue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: (() {
              if (currentpage == 2) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Total: $total_price",
                      style: TextStyle(color: orange, fontSize: 20),
                    ),
                    FloatingActionButton(
                      backgroundColor: orange,
                      onPressed: () {
                        (total_price == 0)
                            ? null
                            : setState(() {
                                //buy();
                                cartitemslist = [];
                                total_price = 0;
                              });
                      },
                      child: Text(
                        "Buy",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                );
              }
            }()),
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(color: darkblue, boxShadow: []),
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    splashRadius: 5,
                    splashColor: Colors.transparent,
                    iconSize: 70,
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      changepage(0);
                    },
                    icon: IconBadge(
                      icon: Icon(
                        Icons.person_outline,
                        color: currentpage == 0 ? orange : Colors.white,
                        size: 30,
                      ),
                      hideZero: true,
                    ),
                  ),
                  IconButton(
                    splashRadius: 5,
                    splashColor: Colors.transparent,
                    iconSize: 70,
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      changepage(1);
                    },
                    icon: IconBadge(
                      icon: Icon(
                        Icons.store,
                        color: currentpage == 1 ? orange : Colors.white,
                        size: 30,
                      ),
                      hideZero: true,
                    ),
                  ),
                  IconButton(
                    splashRadius: 5,
                    splashColor: Colors.transparent,
                    iconSize: 70,
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      changepage(2);
                    },
                    icon: IconBadge(
                      itemCount: cartitemslist.length,
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: currentpage == 2 ? orange : Colors.white,
                        size: 30,
                      ),
                      hideZero: true,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

Container accountpage = Container(
  margin: EdgeInsets.all(20),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        child: Image.asset(
          'assets/images/9.png',
          height: 180,
        ),
      ),
      Text("hosseinbca.prg@gmail.com",
          style: TextStyle(
            fontSize: 17,
          )),
    ],
  ),
);