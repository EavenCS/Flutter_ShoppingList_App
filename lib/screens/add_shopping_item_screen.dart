import 'package:flutter/material.dart';
import 'package:shoppinglist/screens/shopping_item.dart';
import 'config.dart';

class AddShoppingItemScreen extends StatefulWidget {
  AddShoppingItemScreen({Key? key}) : super(key: key);
  @override
  State<AddShoppingItemScreen> createState() => _AddShoppingItemScreenState();
}

class _AddShoppingItemScreenState extends State<AddShoppingItemScreen> {
  // ignore: prefer_final_fields
  TextEditingController _textEditingController =
      TextEditingController(text: ' ');

  @override
  Widget build(BuildContext context) {
    final shoppingList = context
        .dependOnInheritedWidgetOfExactType<Configuration>()!
        .shoppingList;

    return Scaffold(
        appBar: AppBar(
          title: Text('Add Item'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    shoppingList.add(
                      ShoppingItem(
                          name: _textEditingController.text, done: false),
                    );
                    Navigator.pop(context);
                  },
                  child: Text('Add')),
            ],
          ),
        ));
  }
}
