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
              : SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .60,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: cart.basketItems.length,
                      itemExtent: 80,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 500,
                          width: double.infinity,
                                child: Card(
                                    elevation: 0,
                                    shadowColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10.0)),
                                    child: Stack(
                                      children: [
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: Image.asset(cart
                                                .basketItems[index].imageUrl)),
                                        Column(
                                          children: [
                                            Expanded(
                                                child: Align(
                                                  child: Text(cart
                                                      .basketItems[index].price
                                                      .toString()),
                                                  alignment: Alignment.topLeft,
                                                )),
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: CircleAvatar(
                                                  child: IconButton(
                                                      icon: Icon(Icons.close),
                                                      onPressed: () {
                                                        cart.remove(
                                                            cart.basketItems[
                                                            index]);
                                                      }),
                                                  backgroundColor: Colors
                                                      .red[100],),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2),
                                            child: Column(
                                              children: [
                                                Text(cart
                                                    .basketItems[index].name
                                                    .toString()),
                                                Expanded(
                                                  child: Row(
                                                      children: [
                                                        IconButton(
                                                            icon:
                                                            Icon(Icons.add),
                                                            onPressed: () {
                                                              cart.add(
                                                                  cart
                                                                      .basketItems[
                                                                  index]);
                                                            }),
                                                        Text(cart.count
                                                            .toString()),
                                                        IconButton(
                                                            icon: Icon(
                                                                Icons.minimize),
                                                            onPressed: () {
                                                              cart.remove(
                                                                  cart
                                                                      .basketItems[
                                                                  index]);
                                                            }),
                                                      ],
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                        );
                      }),
                ),
                Text(cart.total_price.toString())],
            ),
          ),
        );
      },
    );
  }
}
