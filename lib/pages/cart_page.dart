import 'package:flutter/material.dart';
import 'package:mart_app/main.dart';

class CartPage extends StatefulWidget {
  final FoodItem? initialItem;

  const CartPage({super.key, this.initialItem});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> _cartItems = [

  ];
  static const double taxRate = 0.11;

  @override
  void initState() {
    super.initState();
    if (widget.initialItem != null) {
      _cartItems.add(CartItem(item: widget.initialItem!, id: '', name: '', price: 50000, image: '', category: ''));
    }
  }

  double get subtotal =>
      _cartItems.fold(0, (sum, item) => sum + (item.item.price * item.quantity));
  double get tax => subtotal * taxRate;
  double get total => subtotal + tax;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = _cartItems[index];
                return ListTile(
                  leading: Image.asset(cartItem.item.image),
                  title: Text(cartItem.item.name),
                  subtitle:
                      Text('Rp ${cartItem.item.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (cartItem.quantity > 1) {
                              cartItem.quantity--;
                            } else {
                              _cartItems.removeAt(index);
                            }
                          });
                        },
                      ),
                      Text('${cartItem.quantity}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            cartItem.quantity++;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _cartItems.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal'),
                      Text('Rp ${subtotal.toStringAsFixed(2)}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tax (11%)'),
                      Text('Rp ${tax.toStringAsFixed(2)}'),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Rp ${total.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      //checkout logic >
                    },
                    child: const Text('Checkout'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}