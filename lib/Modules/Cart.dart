import 'package:flutter/cupertino.dart';
import 'package:meal1app/Modules/popular_food_type.dart';

class Cart extends ChangeNotifier {
  List<FoodDetails> meal = [];


  double total_price = 0.0;

  void add(FoodDetails item) {
    meal.add(item);
    total_price += item.price;
    // print(meal.length);
    notifyListeners();
  }

  void remove(FoodDetails item) {
    meal.remove(item);
    total_price -= item.price;
    notifyListeners();
  }

  int get count {
    return meal.length;
  }


  List<FoodDetails> get basketItems => meal;

}
