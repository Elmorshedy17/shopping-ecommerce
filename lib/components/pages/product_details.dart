import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String ProdDetails_name;
  final String ProdDetails_picture;
  final String ProdDetails_old_price;
  final String ProdDetails_new_price;

  ProductDetails(
      {this.ProdDetails_name,
      this.ProdDetails_picture,
      this.ProdDetails_old_price,
      this.ProdDetails_new_price});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
//  Container(
//    height: 300.0,
//    child: Image.asset(widget.ProdDetails_picture),
//  ),

          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                child: Image.asset(widget.ProdDetails_picture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.ProdDetails_name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '\$${widget.ProdDetails_old_price}',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 16.0,
                              color: Colors.black45),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '\$${widget.ProdDetails_new_price}',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('size'),
                            content: Text('Chose The Size'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Close'),
                              )
                            ],
                          );
                        });
                  },
                  textColor: Colors.grey,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Size'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Color'),
                            content: Text('Chose The Color'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Close'),
                              )
                            ],
                          );
                        });
                  },
                  textColor: Colors.grey,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Color'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('size'),
                            content: Text('Chose The Size'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Close'),
                              )
                            ],
                          );
                        });
                  },
                  textColor: Colors.grey,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Quanty'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text('Buy Now'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {},
                color: Colors.red,
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
                color: Colors.red,
              ),
            ],
          ),
          ListTile(
            title: Text('Product Details'),
            subtitle: Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose"),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 14.0, right: 5.0, bottom: 5.0, left: 5.0),
                child: Text(
                  'Product Name',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 14.0, right: 5.0, bottom: 5.0, left: 5.0),
                child: Text(
                  'Blazer',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 14.0, right: 5.0, bottom: 5.0, left: 5.0),
                child: Text(
                  'Product Brand',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 14.0, right: 5.0, bottom: 5.0, left: 5.0),
                child: Text(
                  'D&L',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 14.0, right: 5.0, bottom: 5.0, left: 5.0),
                child: Text(
                  'Product Condition',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 14.0, right: 5.0, bottom: 5.0, left: 5.0),
                child: Text(
                  'Good',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.9, horizontal: 5.0),
            child: Text('Similar Products'),
          ),
          Container(
            height: 360,
            child: SimilarProducts(),
          ),
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  List Products_List = [
    {
      'cate_ID': '1',
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
      'cate_ID': '1',
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
        return SimilarSingleProduct(
          SimilarProd_name: Products_List[index]['name'],
          SimilarProd_picture: Products_List[index]['picture'],
          SimilarProd_old_price: Products_List[index]['old_price'],
          SimilarProd_new_price: Products_List[index]['new_price'],
        );
      },
    );
  }
}

class SimilarSingleProduct extends StatelessWidget {
  final String SimilarProd_name;
  final String SimilarProd_picture;
  final String SimilarProd_old_price;
  final String SimilarProd_new_price;

  SimilarSingleProduct(
      {this.SimilarProd_name,
      this.SimilarProd_picture,
      this.SimilarProd_old_price,
      this.SimilarProd_new_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: SimilarProd_name,
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => ProductDetails(
                          ProdDetails_name: SimilarProd_name,
                          ProdDetails_picture: SimilarProd_picture,
                          ProdDetails_old_price: SimilarProd_old_price,
                          ProdDetails_new_price: SimilarProd_new_price,
                        ),
                  ),
                );
              },
              child: Card(
                child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            SimilarProd_name,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "\$$SimilarProd_new_price",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: Image.asset(
                    SimilarProd_picture,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
