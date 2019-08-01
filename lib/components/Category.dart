import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Cato extends StatelessWidget {
 final String img;
 final String caption;
 final VoidCallback onTap;
 Cato({
   this.img,
   this.caption,
   this.onTap
 });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      child: Container(
        width: 150.0,
//        height: 100.0,
        child: ListTile(
onTap: onTap,
          subtitle:Container(
            height: 20.0,
            child:  Text(caption,style: TextStyle(),textAlign: TextAlign.center,),
          ),
title:Container(
  height: 80.0,
  child: Image.asset(img,fit: BoxFit.cover,),
),

        ),
      )
    );
  }
}




class hListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection:Axis.horizontal,
        children: <Widget>[
         Cato(
            img:'img-1.jpg' ,
            caption:'Shoeses',
          ),Cato(
            img:'img-2.jpg' ,
            caption:'dresses',
          ),Cato(
            img:'img-3.jpg' ,
            caption:'suites',
          ),Cato(
            img:'img-4.jpg' ,
            caption:'uniform',
          ),Cato(
            img:'img-5.jpg' ,
            caption:'unifromal',
          ),Cato(
            img:'img-1.jpg' ,
            caption:'Shoeses again',
          ),
        ],
      ),
    );
  }
}



class Cate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Caregories'),
      padding: EdgeInsets.all(8.0),
    );
  }
}


class RecentPro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Recent Products'),
      padding: EdgeInsets.only(top: 20.0,left: 8.0,right: 8.0,bottom: 8.0),
    );
  }
}