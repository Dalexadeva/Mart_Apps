import 'package:flutter/material.dart';
import 'package:mart_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Order App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}

// models/food_item.dart
class FoodItem {
  final String id;
  final String name;
  final double price;
  final String image;
  final String category;

  FoodItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
  });
}

// models/cart_item.dart
class CartItem {
  final FoodItem item;
  int quantity;

  CartItem({
    required this.item,
    this.quantity = 1, required String id, required String name, required int price, required String image, required String category,
  });
}