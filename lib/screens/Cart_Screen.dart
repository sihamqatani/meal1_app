import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal1app/Modules/Cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'طلباتي',
              style: TextStyle(color: Colors.grey[900]),
            ),
            titleSpacing: 2,
            centerTitle: true,
          ),
          body: cart.basketItems.length == 0
              ? Text(
            'لايوجد طلبات',
          )
              : Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: ListView.builder(
              itemCount: cart.basketItems.length,
              itemExtent: 200,
              itemBuilder: (context, index) =>
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 25, right: 8, left: 8),
                    /*  child: Container(
                               height: MediaQuery.of(context).size.height * .35,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Card(
                                  child:Image.asset(cart.basketItems[index].imageUrl),
                                  elevation: 5,
                                  shadowColor: Colors.pink[100],
                                )),*/
                    child: ListTile(
                      title: Card(
                        child:
                        Image.asset(cart.basketItems[index].imageUrl),
                      ),
                    ),
                  ),
            ),
          ),
        );
      },
    );
  }
}
