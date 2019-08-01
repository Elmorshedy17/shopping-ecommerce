import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_cart = [
    {
      'name': 'Blazer',
      "picture": 'photo_1.jpg',
      "new_price": '90',
      "size": "M",
      "color": "Red",
      "quantatiy": "1"
    },
    {
      'name': 'Bla',
      "picture": 'photo_2.jpg',
      "new_price": '120',
      "size": "L",
      "color": "yellow",
      "quantatiy": "2"
    },
    {
      'name': 'Blaz',
      "picture": 'photo_3.jpg',
      "new_price": '290',
      "size": "S",
      "color": "blue",
      "quantatiy": "5"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Products_on_cart.length,
      itemBuilder: (context, int index) {
        return Single_cart_products(
          cart_Prod_name: Products_on_cart[index]['name'],
          cart_Prod_picture: Products_on_cart[index]['picture'],
          cart_Prod_new_price: Products_on_cart[index]['new_price'],
          cart_Prod_size: Products_on_cart[index]['size'],
          cart_Prod_color: Products_on_cart[index]['color'],
          cart_Prod_quantatiy: Products_on_cart[index]['quantatiy'],
        );
      },
    );
  }
}

class Single_cart_products extends StatelessWidget {
  final String cart_Prod_name;
  final String cart_Prod_picture;
  final String cart_Prod_new_price;
  final String cart_Prod_size;
  final String cart_Prod_color;
  final String cart_Prod_quantatiy;

  Single_cart_products({
    this.cart_Prod_name,
    this.cart_Prod_picture,
    this.cart_Prod_new_price,
    this.cart_Prod_size,
    this.cart_Prod_color,
    this.cart_Prod_quantatiy,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
        children: <Widget>[
          //image
          Image.asset(
            cart_Prod_picture,
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
          ////

          // name & price & color
          Container(
            child: Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        cart_Prod_name,
                        style: TextStyle(
                            fontSize: 21.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(right: 5.0),
                                child: Text('Size :'),
                              ),
                              Container(
//                        padding: EdgeInsets.only(),
                                child: Text(' ${cart_Prod_size}',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Color :'),
                                Text(
                                  ' ${cart_Prod_color}',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "\$${cart_Prod_new_price}",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.red, fontSize: 24.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /////

          // Quanty
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.keyboard_arrow_up),
                onPressed: () {},
              ),
              Text(cart_Prod_quantatiy),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () {},
              ),
            ],
          ),

          ////
        ],
      ),
    );
  }
}

//
//ListTile(
//trailing: Container(
//alignment: Alignment.topCenter,
//height: 100.0,
//child: Column(
//mainAxisAlignment: MainAxisAlignment.start,
//children: <Widget>[
//IconButton(
//icon: Icon(Icons.keyboard_arrow_up),onPressed: (){},
//),
//Text(cart_Prod_quantatiy),
//IconButton(
//icon: Icon(Icons.keyboard_arrow_down),onPressed: (){},
//),
//],
//),
//),
//leading: Image.asset(cart_Prod_picture,height: 100.0,width: 100.0,fit: BoxFit.cover,),
//title:Text(cart_Prod_name) ,
//subtitle: Column(
//children: <Widget>[
//Row(
//children: <Widget>[
//Expanded(
//child: Container(
//child: Row(
//children: <Widget>[
//Text('Size :'),
//Text(' ${cart_Prod_size}',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
//
//],
//),
//padding: EdgeInsets.symmetric(vertical: 5.0),
//),
//),
//Expanded(
//child: Container(
//child: Row(
//children: <Widget>[
//Text('Color :'),
//Text(' ${cart_Prod_color}',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
//
//],
//),
//padding: EdgeInsets.symmetric(vertical: 5.0),
//),
//),
//],
//),
//
//Container(
//alignment: Alignment.topLeft,
//child: Text("\$${cart_Prod_new_price}",textAlign: TextAlign.left,style: TextStyle(color: Colors.red,fontSize: 24.0),),
//),
//],
//),
//),
