import 'package:flutter/material.dart';
import 'package:shoppinglist/screens/shopping_item.dart';


class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<ShoppingItem> shoppingList = [
    ShoppingItem(name: 'Brot', done: false),
    ShoppingItem(name: 'Eis', done: false),
    ShoppingItem(name: 'Bier', done: false),
    ShoppingItem(name: 'Schoko', done: false),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meine Einkaufsliste'),
      ),
      body: ListView.builder(
        itemCount: shoppingList.length,
          itemBuilder: (context,index){
        return  CheckboxListTile(
           title: Text(shoppingList[index].name),
            value: shoppingList[index].done,onChanged: (newValue){
             setState((){
               shoppingList[index].setDone(newValue);
             });
         });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
      ),
    );
  }
}




