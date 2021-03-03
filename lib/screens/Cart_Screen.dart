import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'طلباتي',
          style: TextStyle(color: Colors.grey[900]),
        ),
        titleSpacing: 2,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 60, right: 8, left: 8, bottom: 30),
          child: Container(
              height: MediaQuery.of(context).size.height * .35,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Card(
                elevation: 5,
                shadowColor: Colors.pink[100],
              )),
        ),
      ),
    );
  }
}
