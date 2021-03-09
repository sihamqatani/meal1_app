import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meal1app/Modules/Cart.dart';
import 'package:meal1app/Modules/menu_types.dart';
import 'package:meal1app/Modules/popular_food_type.dart';
import 'package:meal1app/screens/Cart_Screen.dart';
import 'package:meal1app/screens/food_detailsPage.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var rating = 0.0;

  Cateorgy menuType = Cateorgy('برجر', 'assets/Images/Menus/burger.png');
  List<FoodDetails> foodDetails = [
    FoodDetails(
        name: 'رزمع الدجاج ',
        imageUrl: 'assets/Images/Menus/popular_food/popular2.png',
        no_rating: 1.1,
        price: 20),
    FoodDetails(
        name: 'سباجيتي',
        imageUrl: 'assets/Images/Menus/burger.png',
        no_rating: 1.9,
        price: 30),
    FoodDetails(
        name: 'ستيك لحم ',
        imageUrl: 'assets/Images/Menus/burger.png',
        no_rating: 1.5,
        price: 25),
    FoodDetails(
        name: 'سمك مشوي ',
        imageUrl: 'assets/Images/Menus/burger.png',
        no_rating: 2.5,
        price: 60),
  ];

  //print(foodDetails.length);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: bottomNavigatorSection(),
        appBar: AppBar(
          title: Text(
            'تطبيق مزاجي ',
            style: TextStyle(color: Colors.grey[900]),
          ),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                Provider
                    .of<Cart>(context, listen: true)
                    .count
                    .toString(),
                //'2',
                style: TextStyle(color: Colors.pink),
              ),
            ),
            InkWell(
              child: Icon(Icons.notifications_none),
              onTap: () {},
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
                popularFoodMenu(context),
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
            padding: const EdgeInsets.all(16),
            child: Container(
              alignment: Alignment.topRight,
              child: Text('الوجبات الاكثر طلبا',
                  style: TextStyle(color: Colors.grey[600], fontSize: 22)),
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
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.pink[100],
                                size: 25,
                              ),
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
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        "assets/images/Menus/burger2.png",
                                      );
                                    },
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
                                        color: Colors.grey[600], fontSize: 22),
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
                                        /*SmoothStarRating(
                                  allowHalfRating: false,
                                  onRated: (v) {},
                                  starCount: 5,
                                  rating: rating,
                                  size: 20.0,
                                  isReadOnly: false,
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_border,
                                  color: Colors.pink[100],
                                  borderColor: Colors.pink[50],
                                  spacing: 2.0),*/

                                        //Row(
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
                                    Text(
                                      foodDetails[index].price.toString(),
                                      // '\$12 ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.red[200],
                                          fontWeight: FontWeight.bold),
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

  /* Widget popularListItem(FoodDetails foodDetail) {
    return Container(
      height: 400,
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Stack(
          children: [
            Align(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.pink[100],
                  size: 25,
                ),
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
                      foodDetails[foodDetails.length].imageUrl,
                      // 'assets/Images/Menus/popular_food/popular1.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/Menus/burger2.png",
                        );
                      },
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
                    padding: const EdgeInsets.only(top: 210, right: 22),
                    child: Text(
                      foodDetails[foodDetails.length].name,
                      //'ستيك لحم مع الخضار',
                      style: TextStyle(color: Colors.grey[600], fontSize: 22),
                    ),
                  ),
                  alignment: Alignment.centerRight,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          foodDetails[foodDetails.length].no_rating.toString(),
                          // '(1.9)',
                          //  Provider.of<Cart>(context, listen:true )
                          //       .meal.length

                          //  .toString(),
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 22),
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
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.red[200],
                            ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            },
                          ),
                          /*SmoothStarRating(
                                  allowHalfRating: false,
                                  onRated: (v) {},
                                  starCount: 5,
                                  rating: rating,
                                  size: 20.0,
                                  isReadOnly: false,
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_border,
                                  color: Colors.pink[100],
                                  borderColor: Colors.pink[50],
                                  spacing: 2.0),*/

                          //Row(
                        ),
                      ],
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        foodDetails[foodDetails.length].price.toString(),
                        // '\$12 ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red[200],
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: CircleAvatar(
                          backgroundColor: Colors.red[100],
                          radius: 20,
                          child: IconButton(
                              iconSize: 20,
                              color: Colors.white,
                              icon: Icon(
                                Icons.add,
                              ),
                              onPressed: () { Provider.of<Cart>(context, listen: false).basketItems.add(foodDetails[foodDetails.length]);
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
    );
  }*/
  // color: Colors.white,

  // width:MediaQuery.of(ctx).size.width,

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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 100,
      //width: MediaQuery.of(context).size.width,

      child: ListView(
        //shrinkWrap: true,
        children: [
          drawTopMenu(),
          drawTopMenu(),
          drawTopMenu(),
          drawTopMenu(),
          drawTopMenu(),
          drawTopMenu(),
          drawTopMenu(),
        ],
        itemExtent: 50,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  navigateScreen(int selectedIndex) {
    switch (selectedIndex) {
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CartScreen();
        }));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CartScreen();
        }));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Container(
            color: Colors.grey,
          );
        }));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Container(color: Colors.blue);
        }));
        break;
    }
  }

  bottomNavigatorSection() {
    int selectedIndex = 0;

    return BottomNavigationBar(
      onTap: (int x) {
        setState(() {
          selectedIndex = x;
          //  print(selectedIndex);

          navigateScreen(selectedIndex);
        });
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          //  activeIcon: ,
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'اطلب الآن',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard),
          label: 'العروض',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'مفضلاتي',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: 'حسابي',
        ),
      ],
    );
  }

  Widget drawTopMenu() {
    return Container(
      child: Column(
        children: [
          Card(
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
              )),
          Text(
            menuType.name,
            style: TextStyle(color: Colors.grey[600], fontSize: 18),
          ),
        ],
      ),
    );
  }
}
