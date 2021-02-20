import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal1app/Modules/menu_types.dart';

class HomeScreen extends StatelessWidget {
  Cateorgy menuType = Cateorgy('برجر', 'assets/Images/Menus/burger.png');

  /*  Widget topMenuDetails( String name,String imageUrl){
      for(int i=0;i<10;i++){
       menuType;
      }
      return menuType{name,imageUrl};
    }*/

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'تطبيق مزاجي ',
              style: TextStyle(color: Colors.grey[900]),
            ),
            elevation: 0,
            actions: [
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
                ],
              ),
            ),
          ),
        ));
  }

  Widget popularFoodMenu(BuildContext ctx) {
    return Container(
      // color: Colors.white,
      height: 450,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('الوجبات الاكثر طلبا',
                    style: TextStyle(color: Colors.grey[600], fontSize: 22)),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'المزيد',
                  style: TextStyle(color: Colors.lightBlue, fontSize: 22),
                ),
              ),
            ],
          ),
          Container(height: 200,width: MediaQuery.of(ctx).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              itemExtent: 200,
              children: [
                Container(
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))
                  ),
                  color: Colors.white, height: 350,
                  // width:MediaQuery.of(ctx).size.width,
                ),
                Container(
                  child: Card(
                    color: Colors.pink,
                  ),
                  color: Colors.white, height: 350,
                  // width:MediaQuery.of(ctx).size.width,
                ),
                Container(
                  child: Card(
                    color: Colors.pink,
                  ),
                  color: Colors.white, height: 350,
                  // width:MediaQuery.of(ctx).size.width,
                ),
                Container(
                  child: Card(
                    color: Colors.pink,
                  ),
                  color: Colors.white, height: 350,
                  // width:MediaQuery.of(ctx).size.width,
                ),
                Container(
                  child: Card(
                    color: Colors.yellow,
                  ),
                  color: Colors.white, height: 350,
                  // width:MediaQuery.of(ctx).size.width,
                ),
                Container(
                  child: Card(
                    color: Colors.grey,
                  ),
                  color: Colors.white, height: 350,
                  // width:MediaQuery.of(ctx).size.width,
                ),
                Container(
                  child: Card(
                    color: Colors.grey,
                  ),
                  color: Colors.white, height: 350,
                  // width:MediaQuery.of(ctx).size.width,
                ),
                Container(
                  child: Card(
                    color: Colors.grey,
                  ),
                  color: Colors.white, height: 350,
                  // width:MediaQuery.of(ctx).size.width,
                ),
                Container(
                  child: Card(
                    color: Colors.grey,
                  ),
                  color: Colors.white, height: 350,
                  // width:MediaQuery.of(ctx).size.width,
                ),
                Container(
                  child: Card(
                    color: Colors.grey,
                  ),
                  color: Colors.white, height: 350,
                  // width:MediaQuery.of(ctx).size.width,
                ),
              ],
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 100,
      //width: MediaQuery.of(context).size.width,

      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemExtent: 50.0,
          itemBuilder: (context, int i) {
            return Container(
              child: Column(
                children: [
                  Card(
                      child: Container(
                    color: Colors.white,
                    width: 50,
                    height: 50,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
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
          }),
    );
  }
}
