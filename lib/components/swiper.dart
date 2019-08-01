import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Swipo extends StatefulWidget {
  @override
  _SwipoState createState() => new _SwipoState();
}

class _SwipoState extends State<Swipo> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> list = [
      ['assets/photo_1.jpg', 'dasadssd'],
      ['assets/photo_2.jpg', 'dasadssd'],
      ['assets/photo_3.jpg', 'dasadssd'],
      ['assets/photo_4.jpg', 'dasadssd'],
    ];
    return new Container(
      height: 250.0,
//      margin: EdgeInsets.only(bottom: 20.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
//          return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
//
          return GestureDetector(
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Image.asset(
                    (list[index][0]),
                    fit: BoxFit.cover,
                    height: 1200.0,
                    width: 1200.0,
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      // Box decoration takes a gradient
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.1, 0.5, 0.7, 0.9],
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.7),
                          Colors.black.withOpacity(.6),
                          Colors.black.withOpacity(.4),
                        ],
                      ),
                    ),
                    padding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    child: Text(
                      list[index][1],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: list.length,
        autoplay: true,
        onTap: (index) {},
        pagination: new SwiperPagination(alignment: Alignment.topCenter),
        control: new SwiperControl(color: Colors.transparent),
      ),
    );
  }
}
