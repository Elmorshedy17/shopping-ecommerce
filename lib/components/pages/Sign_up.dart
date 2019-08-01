import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yarab/components/pages/sign_in.dart';
import 'package:yarab/db/users.dart';
import 'home.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
//  UserServices _userServices = UserServices();
//
  String _email;
  String _name;
  TextEditingController _passwordControler = TextEditingController();
  TextEditingController _passwordConfirmControler = TextEditingController();
  TextEditingController _nameControler = TextEditingController();
  TextEditingController _emailControler = TextEditingController();

  String gender;
  String groupValue = "male";

  valueChanged(e) {
    setState(() {
      if (e == 'male') {
        groupValue = e;
        gender = e;
      } else if (e == 'female') {
        groupValue = e;
        gender = e;
      }
    });
  }

  bool hidePass = true;

  showPassValue() {
    setState(() {
      if (hidePass) {
        hidePass = false;
      } else if (hidePass == false) {
        hidePass = true;
      }
    });
  }

  String _password;
  String _confirm;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/photo_2.jpg',
                fit: BoxFit.cover,
                color: Color.fromRGBO(255, 255, 255, 0.6),
                colorBlendMode: BlendMode.modulate),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Container(
                height: 180.0,
                width: 400.0,
                child: Image.asset(
                  'assets/lg.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: ListView(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _nameControler,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person_outline),
                                hintText: 'Full Name'),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'this field is required';
                              }
                            },
                            onSaved: (val) {
                              _name = val;
                            },
                          ),
                          TextFormField(
                            controller: _emailControler,
                            decoration: InputDecoration(
                                icon: Icon(Icons.email),
                                hintText: 'Email adress'),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'this field is required';
                              }
                            },
                            onSaved: (val) {
                              _email = val;
                            },
                          ),
                          TextFormField(
                            controller: _passwordControler,
                            obscureText: true,
                            decoration: InputDecoration(
                                icon: Icon(Icons.vpn_key),
                                hintText: 'Password'),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'this field is required';
                              } else if (val.length < 3) {
                                return 'this filed must be more than 2 characters';
                              }
                            },
                            onSaved: (val) {
                              _password = val;
                            },
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                icon: Icon(Icons.account_balance),
                                hintText: 'Confirm Password'),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'this field is required';
                              } else if (val.length < 3) {
                                return 'this filed must be more than 3 characters';
                              } else if (_passwordControler.text != val) {
                                return 'password desnt match';
                              }
                            },
                            onSaved: (val) {
                              _confirm = val;
                            },
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'male',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Radio(
                                      value: 'male',
                                      groupValue: groupValue,
                                      onChanged: (e) => valueChanged(e)),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'female',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Radio(
                                      value: 'female',
                                      groupValue: groupValue,
                                      onChanged: (e) => valueChanged(e)),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            child: RaisedButton(
                              color: Colors.redAccent,
                              textColor: Colors.white,
                              child: Text('Sign Up'),
                              onPressed: LogUp,
                            ),
                          ),
                          Divider(
                            color: Colors.red,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      onTap: () {

                                        Navigator.pushReplacement(
                                            context, MaterialPageRoute(builder: (context) => SignIn()));
                                        },
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                              'have account already ? ',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.black54)),
                                          TextSpan(
                                              text: 'Log In',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.red))
                                        ]),
                                      ))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> LogUp() async {
    final databaseReference = FirebaseDatabase.instance.reference();
    final fomdata = _formKey.currentState;
    String ref = 'Users';
    if (fomdata.validate()) {
      fomdata.save();
      FirebaseUser user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        databaseReference.child(ref).push().set({
          "user name": _nameControler.text,
          "email": _emailControler.text,
          "user id": user.uid,
          "gender": gender,
        }).catchError((onError) {
          print(onError);
        });

        print(user);
      }).catchError((onError) {
        print(onError);
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
      print(_email);
      print(_password);
    }
  }
}
