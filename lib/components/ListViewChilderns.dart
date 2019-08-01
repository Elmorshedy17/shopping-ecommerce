import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yarab/components/pages/Sign_up.dart';
import 'package:yarab/components/pages/sign_in.dart';
import 'pages/cart.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '././pages/ProfileScreen.dart';


class MylistTilo extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  MylistTilo({this.text, this.icon, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      onTap: onTap,
      title: Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: Align(
          child: Text(text),
          alignment: Alignment(-1.2, 0.0),
        ),
      ),
      leading: Icon(
        icon,
        color: color,
      ),
    );
  }
}

class hma extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
    ProfileScreen(),
        MylistTilo(
          text: 'Home Page',
          icon: Icons.home,
          onTap: () {},
        ),
        MylistTilo(
          text: 'My Account',
          icon: Icons.person,
          onTap: () {},
        ),
        MylistTilo(
          text: 'My Orders',
          icon: Icons.shopping_basket,
          onTap: () {},
        ),
        MylistTilo(
          text: 'Cart',
          icon: Icons.shopping_cart,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cart()),
            );
          },
        ),
        Divider(),
        MylistTilo(
          text: 'Setting',
          icon: Icons.settings,
          onTap: () {},
          color: Colors.orange,
        ),
        MylistTilo(
          text: 'About',
          icon: Icons.info,
          onTap: () {},
          color: Colors.blueAccent,
        ),
        MylistTilo(
          text: 'Log Out',
          icon: Icons.call_missed_outgoing,
          onTap: () {
            Future <void> _signOut () async {
              FirebaseAuth.instance.signOut();

              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>SignIn()));
            }
            return _signOut();
          },
          color: Colors.blueAccent,
        ),
      ],
    );
  }
  }

