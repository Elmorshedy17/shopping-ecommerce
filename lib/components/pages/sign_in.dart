import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yarab/components/pages/Sign_up.dart';
import 'home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
//    Scaffold.of(context).showSnackBar(new
//
    SnackBar(
      content: new Text('Sign in'),
    );

    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser userDetails =
        await _firebaseAuth.signInWithCredential(credential);
//    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);
//
//    List<ProviderDetails> providerData = new List<ProviderDetails>();
//    providerData.add(providerInfo);
//
//    UserDetails details = new UserDetails(
//      userDetails.providerId,
//      userDetails.displayName,
//      userDetails.photoUrl,
//      userDetails.email,
//      providerData,
//    );
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new MyHomePage(),
      ),
    );
    return userDetails;
  }

  String _email;
  TextEditingController _passwordControler = TextEditingController();
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
              SizedBox(
                height: 100.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
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
                            SizedBox(
                              height: 20.0,
                            ),
                            RaisedButton(
                              color: Colors.redAccent,
                              textColor: Colors.white,
                              child: Text('Log In'),
                              onPressed: Login,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Divider(
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Divider(),
                            Text('you can sign in with google'),
                            RaisedButton(
                              onPressed: () => _signIn(context)
                                  .then((FirebaseUser user) => print(user))
                                  .catchError((e) => print(e)),
                              child: Text('Google Sign in',style: TextStyle(color: Colors.white),),
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUp()));
                                        },
                                        child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    'Dont have account already ? ',
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.black54)),
                                            TextSpan(
                                                text: 'Sign Up',
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> Login() async {
    final fomdata = _formKey.currentState;
    if (fomdata.validate()) {
      fomdata.save();

      FirebaseUser _fireauth = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
      print(_email);
      print(_password);
    }
//    print(_passwordControler.text);
//
  }
}
