import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  Login_State createState() => Login_State();
}

class Login_State extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .8,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
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
                  drawButtom(),
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
                    style: TextStyle(
                        color: Colors.red[200], fontFamily: 'Cairo')),
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
            width: MediaQuery
                .of(context)
                .size
                .width * 0.8,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.7,
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
                              color: Colors.black54, fontFamily: 'Cairo'),
                        ),
                      ]),
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      FlatButton(
                        child: Text(
                          'نسيت كلمةالسر',
                          style: TextStyle(color: Colors.black54,
                              fontSize: 18,
                              fontFamily: 'Cairo'),
                        ),
                        onPressed: () {},
                      ),
                    ],
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
                            onPressed: () {}),
                        height: 1.4 * (MediaQuery
                            .of(context)
                            .size
                            .height / 20),
                        width: 5 * (MediaQuery
                            .of(context)
                            .size
                            .width / 10),
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
