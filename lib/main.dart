import 'package:flutter/material.dart';
import '../provider/item_provider.dart';
import 'package:provider/provider.dart';
import 'screens/item_list_screen.dart';
import 'screens/edit_item_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Editor Lab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: ItemListScreen.routeName,
      routes: {
        ItemListScreen.routeName: (context) => const ItemListScreen(),
        EditItemScreen.routeName: (context) => const EditItemScreen(),
      },
    );
  }
}