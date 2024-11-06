import 'package:mart_app/main.dart';

class CartItem {
  final FoodItem foodItem;
  int quantity;

  CartItem({
    required this.foodItem,
    this.quantity = 1,
  });

  double get price => foodItem.price;
  double get total => price * quantity;
}