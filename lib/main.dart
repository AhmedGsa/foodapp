import 'package:flutter/material.dart';
import 'package:foodapp/Screens/cart.dart';
import 'Screens/home.dart';
import 'Screens/food.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/" :(context) => Home(),
      "/food" :(context) => FoodScreen(),
      "/cart" :(context) => Cart(),
    },
    initialRoute: "/cart",
    theme: ThemeData(fontFamily: "Radomir Tinkov - Gilroy-ExtraBold.otf"),
  ));
}
