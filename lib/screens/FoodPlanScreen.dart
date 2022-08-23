import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shoppinglist/screens/add_shopping_item_screen.dart';

class FoodPlan extends StatefulWidget {
  const FoodPlan({Key? key}) : super(key: key);

  @override
  State<FoodPlan> createState() => _FoodPlanState();
}

class _FoodPlanState extends State<FoodPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          child: const Text(
            "Food Plan",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ));
  }
}
