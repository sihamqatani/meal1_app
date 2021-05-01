import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal1app/Modules/auth_firebase.dart';
import 'package:meal1app/screens/Home_Page.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  SignUp_State createState() => SignUp_State();
}

class SignUp_State extends State<SignUp> {
  String _name, _password, _email;
  FirebaseAuth instance = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  drawLogo(),
                  drawSingIn(context),
                  //drawButtom(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget drawLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            'حسابي',
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo'),
          ),
        ),
      ],
    );
  }

  Widget drawButtom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
            onPressed: () {},
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'لاتمتلك حساب',
                    style: TextStyle(color: Colors.black, fontFamily: 'Cairo')),
                TextSpan(
                    text: 'انشئ حسابك',
                    style:
                        TextStyle(color: Colors.red[200], fontFamily: 'Cairo')),
              ]),
            ))
      ],
    );
  }

  Widget drawSingIn(context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
// borderRadius: BorderRadius.only(
//topLeft: Radius.circular(30), topRight: Radius.circular(30))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "تسجيل",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black54,
                              fontFamily: 'Cairo'),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.face,
                        color: Colors.red[50],
                      ),
                      labelText: ' الاسم',
                      hintText: 'الرجاءادخال االاسم',
                    ),
                    onChanged: (value) {
                      setState(() {
                        this._name = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.red[50],
                      ),
                      labelText: ' الايميل او رقم الهاتف',
                      hintText: 'الرجاءادخال الايميل او رقم الهاتف',
                    ),
                    onChanged: (value) {
                      setState(() {
                        this._email = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.red[50],
                      ),
                      labelText: 'ادخل كلمة المرور',
                      hintText: 'الرجاء ادخال كلمةالمرور',
                    ),
                    onChanged: (value) {
                      setState(() {
                        this._password = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: RaisedButton(
                            color: Colors.red[200],
                            child: Text(
                              'تسجيل',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontFamily: 'Cairo'),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () async {
                              UserCredential credential =
                                  await instance.createUserWithEmailAndPassword(
                                      email: this._email,
                                      password: this._password);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage(
                                          Provider.of<AuthProvider>(context)
                                              .user)));

                              try {} on FirebaseAuthException catch (e) {
                                print('there is exception');
                              }
                            }),
                        height: 1.4 * (MediaQuery.of(context).size.height / 20),
                        width: 5 * (MediaQuery.of(context).size.width / 10),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '-OR-',
                        style: TextStyle(fontSize: 16, fontFamily: 'Cairo'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
// margin: EdgeInsets.only(bottom: 19),
                              child: CircleAvatar(
                            radius: 100,
// backgroundColor: Colors.lightBlueAccent,
                            child: Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.white,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      )
    ]);
  }
}
