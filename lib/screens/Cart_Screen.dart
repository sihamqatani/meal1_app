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
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            bottomNavigationBar: Container(
              color: Colors.white,
              width: 50,
              height: 150,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 16),
                    child: Text(
                      'اجمالي المبلغ :                  ${cart.total_price
                          .toString()}',
                      style: TextStyle(
                        color: Colors.red[200],
                        fontWeight:
                        FontWeight.bold,
                        fontSize: 18,),

                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: SizedBox(width: 200,
                      child: RaisedButton(shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.red[200],
                        onPressed: () {},
                        child: Text('ادفع الان', style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            letterSpacing: 2),),
                      ),
                    ),
                  )
                ],
              ),
            ),
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
                : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: cart.basketItems.length,
                      // itemExtent: 40,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 3, left: 6, right: 6, top: 12),
                          child: Container(
                              height: 120,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    //   mainAxisAlignment:
                                    //    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 45,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.red[100]),
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: InkWell(
                                                  child: Icon(
                                                    Icons.arrow_upward,
                                                    size: 22,
                                                    color: Colors.red[100],
                                                  ),
                                                  onTap: () {
                                                    cart.add(cart
                                                        .basketItems[index]);
                                                  },
                                                )),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Expanded(
                                                child: Text(
                                                  cart.count.toString(),
                                                  style: TextStyle(
                                                      color: Colors.red[200],
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 18),
                                                )),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                child: Icon(
                                                  Icons.arrow_downward,
                                                  size: 22,
                                                  color: Colors.red[100],
                                                ),
                                                onTap: () {
                                                  cart.remove(cart
                                                      .basketItems[index]);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(cart
                                                    .basketItems[index]
                                                    .imageUrl),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Expanded(
                                            child: Text(
                                              cart.basketItems[index].name
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 22,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            cart.basketItems[index].price
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.red[600],
                                                fontSize: 20,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      //SizedBox(width: 30,),
                                            Expanded(
                                              child: GestureDetector(
                                                child: Align(
                                                    alignment:
                                                    Alignment.centerLeft,
                                                    child: Icon(
                                                      Icons.cancel,
                                                      color: Colors.red[100],
                                                    )),
                                                onTap: () {
                                                  cart.remove(
                                                      cart.basketItems[index]);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget cardOrder() {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Card(
          child: Padding(
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 75,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red[100]),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Icon(Icons.arrow_upward),
                        onTap: () {},
                      ),
                      Text(''),
                      InkWell(
                        child: Icon(Icons.arrow_downward),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(''), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(''),
                    Text(''),
                  ],
                ),
                Icon(Icons.cancel),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
        ));
  }
}
