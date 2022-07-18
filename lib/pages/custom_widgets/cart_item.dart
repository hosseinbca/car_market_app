/*import 'package:flutter/material.dart';
import 'package:marketapp/pages/home_page.dart';

class cc extends StatefulWidget {
  @override
  _ccState createState() => _ccState();
}

class _ccState extends State<cc> {

  @override
  Widget build(BuildContext context) {
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
                      color: Colors.black38,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      width: 400,
                      child: Row(
                        children: [
                          cartitemslist[index].image,
                          Text(cartitemslist[index].name),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  total_price -= cartitemslist[index].price;
                                  cartitemslist.remove(cartitemslist[index]);
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
  }
}
*/