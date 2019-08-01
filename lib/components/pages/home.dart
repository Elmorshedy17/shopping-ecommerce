import 'package:flutter/material.dart';
import '../pages/cart.dart';
import '../swiper.dart';
import '../ListViewChilderns.dart';
import '../Category.dart';
import '../products.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:fluttertoast/fluttertoast.dart';


class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Ecommerce'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: hma(),
      ),
      body: ListView(
        children: <Widget>[
//          image_carousel,
          Swipo(),
          Cate(),
          hListView(),
          RecentPro(),
          Container(
            height: 320.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}

