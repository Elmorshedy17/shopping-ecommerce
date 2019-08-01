import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '././pages/product_details.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List Products_List = [
    {
      'name': 'Blazer',
      "picture": 'photo_1.jpg',
      "old_price": '120',
      "new_price": '90'
    },
    {
      'name': 'Bla',
      "picture": 'photo_2.jpg',
      "old_price": '120',
      "new_price": '90'
    },
    {
      'name': 'Blaz',
      "picture": 'photo_3.jpg',
      "old_price": '120',
      "new_price": '90'
    },
    {
      'name': 'Bl',
      "picture": 'photo_4.jpg',
      "old_price": '120',
      "new_price": '90'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: Products_List.length,
      itemBuilder: (BuildContext context, int index) {
        return SingleProduct(
          Prod_name: Products_List[index]['name'],
          Prod_picture: Products_List[index]['picture'],
          Prod_old_price: Products_List[index]['old_price'],
          Prod_new_price: Products_List[index]['new_price'],
        );
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final String Prod_name;
  final String Prod_picture;
  final String Prod_old_price;
  final String Prod_new_price;

  SingleProduct(
      {this.Prod_name,
      this.Prod_picture,
      this.Prod_old_price,
      this.Prod_new_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: Prod_name,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                        ProdDetails_name: Prod_name,
                        ProdDetails_picture: Prod_picture,
                        ProdDetails_old_price: Prod_old_price,
                        ProdDetails_new_price: Prod_new_price,
                      ),
                ),
              );
            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        Prod_name,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "\$$Prod_new_price",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
              child: Image.asset(
                Prod_picture,
                fit: BoxFit.cover,
              ),
            ),
          )),
    );
  }
}


//
//https://console.firebase.google.com/project/ecommerce-8477d/overview