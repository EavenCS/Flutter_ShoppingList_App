import 'package:flutter/cupertino.dart';
import 'package:shoppinglist/screens/shopping_item.dart';

class Configuration extends InheritedWidget {
  final List<ShoppingItem> shoppingList;

  Configuration({
    required this.shoppingList,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(Configuration oldWidget) {
    return shoppingList != oldWidget.shoppingList;
  }
}
