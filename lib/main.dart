import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shoppinglist/screens/add_shopping_item_screen.dart';
import 'package:shoppinglist/screens/config.dart';
import 'package:shoppinglist/screens/settings.dart';
import 'package:shoppinglist/screens/shopping_item.dart';
import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Configuration(
      shoppingList: [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Einkaufsliste',
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (context) => NavigationBase(),
          '/add': (context) => AddShoppingItemScreen(),
        },
      ),
    );
  }
}

class NavigationBase extends StatefulWidget {
  const NavigationBase({Key? key}) : super(key: key);

  @override
  State<NavigationBase> createState() => _NavigationBaseState();
}

///Drawer logic
class _NavigationBaseState extends State<NavigationBase> {
  int currentIndex = 0;

  void navigateToPage(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildBody(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [Text('Oversight')],
            )),
            ListTile(
              title: const Text('Shopping Item List'),
              onTap: () {
                navigateToPage(0);
              },
            ),
            ListTile(
              title: const Text('Receptive'),
              onTap: () {
                navigateToPage(1);
              },
            ),
            ListTile(
              title: const Text('Fridge content'),
              onTap: () {
                navigateToPage(2);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                navigateToPage(3);
              },
            ),
          ],
        ),
      ),
    );
  }

  ///Index for the Drawer
  IndexedStack buildBody() {
    return IndexedStack(
      index: currentIndex,
      children: [
        ShoppingListScreen(),
        Rezepte(),
        const Settings(),
      ],
    );
  }
}
