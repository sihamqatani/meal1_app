import 'package:meal1app/Modules/popular_food_type.dart';

class Cart {
  List<FoodDetails> meal = [];
  double total_price;

  void add(FoodDetails item) {
    meal.add(item);
    total_price += item.price;
  }

  void remove(FoodDetails item) {
    meal.remove(item);
    total_price -= item.price;
  }
}
