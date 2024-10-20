import 'package:flutter/material.dart';
import 'package:shopping_list/models/shopping_item.dart';
import 'package:shopping_list/ui/home.dart';
import 'package:shopping_list/ui/shopping_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, List<ShoppingItem>> shoppingLists = {
    'Morning breakfast': [
      ShoppingItem(itemName: "Milk", category: "Dairy", quantity: 1),
      ShoppingItem(itemName: "Butter", category: "Dairy", quantity: 1),
      ShoppingItem(itemName: "Parmesan cheese", category: "Dairy", quantity: 1),
      ShoppingItem(itemName: "Eggs", category: "Dairy", quantity: 1),
      ShoppingItem(itemName: "Bread", category: "Bakery", quantity: 1),
      ShoppingItem(itemName: "Blueberry muffins", category: "Bakery", quantity: 1),
    ],
    'Dinner by Sarah': [],
    'Pizza day!': [],
    'Italian spaghetti': [],
    'Drinks': [],
  };

  String _view = 'home';

  void changeView(String newView) {
    setState(() {
      _view = newView;
    });
  }

  void addNewShoppingList(String newShoppingListName) {
    shoppingLists.putIfAbsent(newShoppingListName, () => []);
    setState(() {});
  }

  void addNewItem(ShoppingItem shoppingItem) {
    shoppingLists[_view]?.add(shoppingItem);
    setState(() {});
  }

  Widget getView() {
    if (_view == 'home') {
      return Home(
        shoppingLists: shoppingLists.keys.toList(),
        addNewShoppingList: addNewShoppingList,
        openShoppingList: changeView,
      );
    } else {
      return ShoppingList(
          title: _view,
          shoppingLists: shoppingLists[_view],
          addNewItem: addNewItem,
          crossOfItem: () {},
          exitList: changeView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return getView();
  }
}
