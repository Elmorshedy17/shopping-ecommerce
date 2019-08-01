import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  File image;
  String imgUrl1;
  File newImage;
  String imgtesto;
  String _imageUrl;


  void initState() {
    super.initState();

    var ref = FirebaseStorage.instance.ref().child("images/");
    ref.getDownloadURL().then((loc) => setState(() => _imageUrl = loc));
  }

  _showDialog(){
    showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text('Choose Picture from'),
        actions: <Widget>[
          FlatButton(
            child: Text('Camera'),
            onPressed: uploadPic,
          ),
          FlatButton(
            child: Text('gallery'),
            onPressed: PickerGallery,
          ),
        ],
      );
    });
  }


  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<Uri> uploadPic() async {

    //Get the file from the image picker and store it
    File image = await ImagePicker.pickImage(source: ImageSource.camera);

    //Create a reference to the location you want to upload to in firebase
    StorageReference reference = _storage.ref().child("images/");

    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(image);
    Navigator.pop(context);
  }
  PickerGallery() async{
    print("Picker Gallery is called");
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
//  File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //Create a reference to the location you want to upload to in firebase
    StorageReference reference = _storage.ref().child("images/");
    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(image);
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: UserAccountsDrawerHeader(
        accountName: Text('MoRoOo'),
        accountEmail: Text('Morooo.nabil17@gmail.com'),
        currentAccountPicture: GestureDetector(
          child:
          CircleAvatar(
            child: GestureDetector(
//              child: ,
              onTap:
              _showDialog,
            ),
            radius: 30.0,
            backgroundImage:

            _imageUrl == null ? NetworkImage('https://via.placeholder.com/150')
                :NetworkImage(_imageUrl) ,


            backgroundColor: Colors.transparent,
          ),
//            CircleAvatar(
//              backgroundColor: Colors.grey,
//              child:
////              Icon(
////                Icons.person,
////                color: Colors.white,
////                size: 40.0,
////              )
//              Image.asset('assets/img-1.jpg'),
//            ),
          onTap: () {},
        ),
      ),
    );
  }
}

//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import './home.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import './login.dart';
//
//class ProfileScreen extends StatelessWidget {
//  final UserDetails detailsUser;
//
//  ProfileScreen({Key key, @required this.detailsUser}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    final GoogleSignIn _gSignIn = GoogleSignIn();
//
//    return Scaffold(
//        appBar: AppBar(
//          title: Text(detailsUser.userName),
//          automaticallyImplyLeading: false,
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(
//                FontAwesomeIcons.signOutAlt,
//                size: 20.0,
//                color: Colors.white,
//              ),
//              onPressed: () {
//                _gSignIn.signOut();
//                print('Signed out');
//                Navigator.pop(context);
//              },
//            ),
//          ],
//        ),
//        body: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              CircleAvatar(
//                backgroundImage: NetworkImage(detailsUser.photoUrl),
//                radius: 50.0,
//              ),
//              SizedBox(height: 10.0),
//              Text(
//                "Name : " + detailsUser.userName,
//                style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                    color: Colors.black,
//                    fontSize: 20.0),
//              ),
//              SizedBox(height: 10.0),
//              Text(
//                "Email : " + detailsUser.userEmail,
//                style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                    color: Colors.black,
//                    fontSize: 20.0),
//              ),
//              SizedBox(height: 10.0),
//              Text(
//                "Provider : " + detailsUser.providerDetails,
//                style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                    color: Colors.black,
//                    fontSize: 20.0),
//              ),
//              Container(
//                margin: EdgeInsets.only(top: 20.0),
//                child: MaterialButton(
//                  onPressed: () {
//                    Navigator.pushReplacement(context,
//                        MaterialPageRoute(builder: (context) => MyHomePage()));
//                  },
//                  color: Colors.redAccent,
//                  child: Text(
//                    'Go',
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold, color: Colors.white),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ));
//  }
//}
