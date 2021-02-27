import 'package:flutter/material.dart';

class FoodPageDetails extends StatefulWidget {
  @override
  _FoodPageDetailsState createState() => _FoodPageDetailsState();
}

class _FoodPageDetailsState extends State<FoodPageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Image.asset('assets/Images/Menus/popular_food/burger2.png',fit:BoxFit.cover ,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
