import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/item_provider.dart';
import 'edit_item_screen.dart';

class ItemListScreen extends StatelessWidget {
  static const String routeName = '/';
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item list')),
      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, child) {
          return ListView.builder(
            itemCount: itemProvider.items.length,
            itemBuilder: (context, index) {
              final item = itemProvider.items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.description),
                trailing: const Icon(Icons.edit),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    EditItemScreen.routeName,
                    arguments: item, // ส่งอ็อบเจกต์ Item ทั้งหมดไปกับ route
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}