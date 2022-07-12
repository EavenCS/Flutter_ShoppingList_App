// ignore_for_file: prefer_const_literals_to_create_immutables, list_remove_unrelated_type

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoppinglist/screens/config.dart';
import 'package:shoppinglist/screens/shopping_item.dart';

class ShoppingListScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ShoppingListScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  var x = 2;
  @override
  Widget build(BuildContext context) {
    final shoppingList = context
        .dependOnInheritedWidgetOfExactType<Configuration>()!
        .shoppingList;

    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Meine Einkaufsliste'),
      ),
      body: ListView.builder(
          itemCount: shoppingList.length,
          itemBuilder: (context, index) {
            var DoNothing;
            return Slidable(
              key: ValueKey(0),
              startActionPane: ActionPane(
                motion: ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: [
                  SlidableAction(
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                    onPressed: DoNothing,
                  ),
                ],
              ),
              // ignore: prefer_const_constructors
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  // ignore: prefer_const_constructors
                  SlidableAction(
                    onPressed: DoNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Delete',
                  ),
                ],
              ),

              child: CheckboxListTile(
                  title: Text(shoppingList[index].name),
                  value: shoppingList[index].done,
                  onChanged: (newValue) {
                    setState(() {
                      shoppingList[index].setDone(newValue);
                    });
                  }),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
