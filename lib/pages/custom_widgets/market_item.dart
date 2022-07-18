/*import 'package:flutter/material.dart';
import 'package:marketapp/pages/home_page.dart';
import 'package:marketapp/pages/cars.dart';
class marketitem extends StatelessWidget {
  var i;
  marketitem(this.i) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: 400,
      child: Row(
        children: [
          marketitemslist[i].image,
          Column(
            children: [
              Text(marketitemslist[i].name),
              Text(marketitemslist[i].model),
              Text("${marketitemslist[i].price}"),
              Text(marketitemslist[i].about)
            ],
          ),
          IconButton(
              onPressed: () {
                cartitemslist.add(marketitemslist[i]);
                total_price += marketitemslist[i].price;
              },
              icon: Icon(Icons.add_shopping_cart_outlined)),
        ],
      ),
    );
  }
}*/