import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meal1app/Modules/Cart.dart';
import 'package:meal1app/Modules/menu_types.dart';
import 'package:meal1app/Modules/popular_food_type.dart';

import 'package:meal1app/screens/food_detailsPage.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';


import 'gridVie_food.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool is_favorite = true;

  var rating = 0.0;

  List<Cateorgy> menuType = [
    Cateorgy('برجر', 'assets/Images/Menus/burger.png'),
    Cateorgy('بيتزا', 'assets/Images/Menus/pizza-slice.png'),
    Cateorgy('ايسكريم', 'assets/Images/Menus/ice-cream.png'),
    Cateorgy('لحم', 'assets/Images/Menus/meat.png'),
    Cateorgy('معجنات', 'assets/Images/Menus/croissant.png'),
    Cateorgy('دجاج', 'assets/Images/Menus/chicken-leg.png'),
    Cateorgy('سباجيتي', 'assets/Images/Menus/noodles.png'),
    Cateorgy('مشروبات', 'assets/Images/Menus/cola.png'),
    Cateorgy('أرز', 'assets/Images/Menus/rice.png'),
  ];
  List<FoodDetails> foodDetails = [
    FoodDetails(
        name: 'رزمع الدجاج ',
        imageUrl: 'assets/Images/Menus/popular_food/popular2.png',
        no_rating: 1.1,
        price: 20),
    FoodDetails(
        name: 'برياني ',
        imageUrl: 'assets/Images/Menus/b.png',
        no_rating: 1.9,
        price: 30),
    FoodDetails(
        name: 'برجركلاسيكي ',
        imageUrl: 'assets/Images/Menus/b.png',
        no_rating: 1.5,
        price: 25),
    FoodDetails(
        name: 'بيتزا ',
        imageUrl: 'assets/Images/Menus/p.png',
        no_rating: 2.5,
        price: 60),
  ];
  List imageSlider = [
    'assets/Images/Menus/p.png',
    'assets/Images/Menus/b.png',
    'assets/Images/Menus/b.png'
  ];

  Widget drawTextSlider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.topRight,
        child: Text('الوجبات المتوفرةاليوم',
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo'
            )),
      ),
    );
  }

  Widget drawImageSlider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CarouselSlider.builder(
          itemCount: imageSlider.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.white,
                    //  offset: new Offset(10.0, 10.0),
                  ),
                ],
              ),
              height: 200,
              // color: Colors.white,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(
                imageSlider[index],
                fit: BoxFit.fill,
              ),
            );
          },
          options: CarouselOptions(
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlay: true,
            // dotSize: 6.0,
            autoPlayInterval: Duration(seconds: 3),
          )),
    );
  }

  //print(foodDetails.length);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //bottomNavigationBar: bottomNavigatorSection(),
        appBar: AppBar(
          title: Text(
            ' مزاجي ',
            style: TextStyle(color: Colors.grey[900], fontFamily: 'Cairo'),
          ),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: InkWell(
                child: Badge(
                  shape: BadgeShape.circle,
                  badgeColor: Colors.red[200],
                  animationType: BadgeAnimationType.scale,
                  badgeContent: Text(
                    Provider
                        .of<Cart>(context, listen: true)
                        .count
                        .toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cairo'
                    ),
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.red[300],
                    size: 20,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                searchPart(),
                topMenuPart(),
                drawTextSlider(),
                drawImageSlider(),
                popularFoodMenu(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget popularFoodMenu(BuildContext ctx) {
    //var rating;
    return Container(
      // color: Colors.white,
      height: 440,
      child: Column(
        children: [
          Padding(
            padding:
            const EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 8),
            child: Container(
              alignment: Alignment.topRight,
              child: Text('الوجبات الاكثر طلبا',
                  style: TextStyle(color: Colors.grey[600],
                      fontSize: 22,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold
                  )),
            ),
          ),
          Container(
            height: 350,
            padding: EdgeInsets.only(right: 8, left: 8),
            width: MediaQuery.of(ctx).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 200,
              itemCount: foodDetails.length,
              itemBuilder: (context, index) =>
                  Container(
                    height: 400,
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Stack(
                        children: [
                          Align(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  is_favorite = !is_favorite;
                                  // is_favorite=true;
                                });
                              },
                              icon: is_favorite
                                  ? Icon(
                                Icons.favorite_border,
                                size: 25,
                              )
                                  : Icon(
                                Icons.favorite,
                                size: 25,
                              ),
                              color: Colors.pink[100],
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.only(bottom: 100),
                              width: double.infinity,
                              height: 350,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    return Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return FoodPageDetails();
                                        }));
                                  },
                                  child: Image.asset(
                                    foodDetails[index].imageUrl,
                                    // 'assets/Images/Menus/popular_food/popular1.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(top: 210, right: 22),
                                  child: Text(
                                    foodDetails[index].name,
                                    //'ستيك لحم مع الخضار',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 18,
                                        fontFamily: 'Cairo'),
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 8, left: 8),
                                child: Align(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        foodDetails[index].no_rating.toString(),
                                        // '(1.9)',
                                        //  Provider.of<Cart>(context, listen:true )
                                        //       .meal.length

                                        //  .toString(),
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 22),
                                      ),
                                      Container(
                                        child: RatingBar.builder(
                                          itemSize: 20,
                                          initialRating: 1,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                          itemBuilder: (context, _) =>
                                              Icon(
                                                Icons.star,
                                                color: Colors.red[200],
                                              ),
                                          onRatingUpdate: (rating) {
                                            // print(rating);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.centerRight,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text('${foodDetails[index].price
                                        .toString()}ريال'
                                      ,
                                      // '\$12 ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red[200],
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Cairo'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 14),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red[100],
                                        radius: 20,
                                        child: IconButton(
                                            iconSize: 20,
                                            color: Colors.white,
                                            icon: Icon(
                                              Icons.add,
                                            ),
                                            onPressed: () {
                                              Provider.of<Cart>(context,
                                                  listen: false)
                                                  .add(foodDetails[index]);
                                              // print(foodDetails.length);

                                              // print();
                                              //  print(foodDetails.length);
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

              //popularListItem(),
              //popularListItem(),
              // popularListItem(),
            ),
          )
        ],
      ),
    );
  }

  Widget searchPart() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'اكتب الوجبة التي تريدها',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red[50]),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.red[100],
            ),
          ),
        ),
      ),
    );
  }

  Widget topMenuPart() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 20),
        height: 100,
        width: MediaQuery
            .of(context)
            .size
            .width,

        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => drawTopMenu(menuType[index]),
          //shrinkWrap: true,

          itemCount: menuType.length,
          itemExtent: 50,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget drawTopMenu(Cateorgy menuType) {
    return Container(
      // margin:EdgeInsets.symmetric(horizontal:5),
      child: Column(
        children: [
          Card(margin: EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => GridViewDishes()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  width: 50,
                  height: 50,
                  child: Card(
                    elevation: 0,
                    /* shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),*/

                    child: Container(
                      width: 25,
                      height: 25,
                      child: Center(
                        child: Image.asset(menuType.imageUrl),
                      ),
                    ),
                  ),
                ),
              )),
          //SizedBox(width: 10,height: 10,),
          Text(
            menuType.name,
            style: TextStyle(
                color: Colors.grey[900], fontSize: 12, fontFamily: 'Cairo'),
          ),
        ],
      ),
    );
  }
}
