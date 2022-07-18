import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shoppinglist/screens/add_shopping_item_screen.dart';
import 'package:shoppinglist/screens/config.dart';
import 'package:shoppinglist/screens/screens.dart';

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
  int _currentIndex = 0;

  void navigateToPage(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  /*final List<Widget> _pages = [
    ShoppingListScreen(),
    const Settings(),
    const Rezepte(), 
  ]; */
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromARGB(255, 32, 31, 31),
            gap: 8,
            onTabChange: (navigateToPage) {
              ;
            },
            padding: const EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.list,
                text: 'Einkaufsliste',
                onPressed: () {
                  navigateToPage(0);
                },
              ),
              GButton(
                icon: Icons.menu_book,
                text: 'Rezepte',
                onPressed: () {
                  navigateToPage(1);
                },
              ),
              GButton(
                icon: Icons.inventory,
                text: 'Essensplan',
                onPressed: () {
                  navigateToPage(2);
                },
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
                onPressed: () {
                  navigateToPage(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///Index for the Drawer
  IndexedStack buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        ShoppingListScreen(),
        Rezepte(),
        Settings(),
      ],
    );
  }
}
