import 'package:flutter/material.dart';
import 'package:mart_app/pages/add_menu_page.dart';

class MenuListPage extends StatelessWidget {
  const MenuListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddMenuPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 3, // Replace with actual menu items
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('assets/food_image.png'),
            title: const Text('Menu Item'),
            subtitle: const Text('Rp 50.000'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Implement delete logic
              },
            ),
          );
        },
      ),
    );
  }
}
