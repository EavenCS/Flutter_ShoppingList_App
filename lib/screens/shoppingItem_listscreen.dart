// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoppinglist/screens/config.dart';
import 'package:shoppinglist/screens/screens.dart';

class ShoppingListScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ShoppingListScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  void _showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(text),
      ));
  }

  @override
  Widget build(BuildContext context) {
    final shoppingList = context
        .dependOnInheritedWidgetOfExactType<Configuration>()!
        .shoppingList;

    return Scaffold(
      appBar: AppBar(
        /* shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))), */
        centerTitle: true,
        // ignore: prefer_const_constructors
        title: Text(
          'Meal Plan',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
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
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
