import 'package:flutter/material.dart';
import 'package:foodapp/custom_classes.dart';
import 'package:foodapp/constants.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;
  int selectedTab = 1;
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Menu",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFF6b45bc),
                        ),
                        Icon(
                          Icons.account_box,
                          color: Colors.grey[200],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xffefefef)),
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: "Search",
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyTab(
                      num: 1,
                      img: "fork.png",
                      label: "All",
                      selectedTab: selectedTab,
                      onTap: () {
                        setState(() {
                          selectedTab = 1;
                        });
                      },
                    ),
                    MyTab(
                      num: 2,
                      img: "pizza.png",
                      label: "Pizzas",
                      selectedTab: selectedTab,
                      onTap: () {
                        setState(() {
                          selectedTab = 2;
                        });
                      },
                    ),
                    MyTab(
                      num: 3,
                      img: "dishes.png",
                      label: "Dishes",
                      selectedTab: selectedTab,
                      onTap: () {
                        setState(() {
                          selectedTab = 3;
                        });
                      },
                    ),
                    MyTab(
                      num: 4,
                      img: "extra.png",
                      label: "Extra",
                      selectedTab: selectedTab,
                      onTap: () {
                        setState(() {
                          selectedTab = 4;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Popular",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FoodCard(
                      price: "400",
                      img: "couscous.jpeg",
                      name: "Couscous",
                      onTap: () {
                        Navigator.pushNamed(context, "/food", arguments: {
                          "price": "400",
                          "img": "couscous.jpeg",
                          "name": "Couscous"
                        });
                      },
                    ),
                    FoodCard(
                      price: "150",
                      img: "baghrir.jpg",
                      name: "Baghrir",
                      onTap: () {
                        Navigator.pushNamed(context, "/food", arguments: {
                          "price": "150",
                          "img": "baghrir.jpg",
                          "name": "Baghrir"
                        });
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FoodCard(
                      price: "400",
                      img: "chekhchoukha.png",
                      name: "Chakhchoukha",
                      onTap: () {
                        Navigator.pushNamed(context, "/food", arguments: {
                          "price": "400",
                          "img": "chekhchoukha.png",
                          "name": "Cha5chou5a"
                        });
                      },
                    ),
                    FoodCard(
                      price: "50",
                      img: "9alblouz.jpg",
                      name: "9alb Louz",
                      onTap: () {
                        Navigator.pushNamed(context, "/food", arguments: {
                          "price": "50",
                          "img": "9alblouz.jpg",
                          "name": "9alb Louz"
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  color: selectedColor,
                  onPressed: (() {}),
                  icon: Icon(
                    Icons.home,
                    size: 40,
                  )),
              IconButton(
                  color: unselectedColor,
                  onPressed: (() {
                    setState(() {});
                  }),
                  icon: Icon(
                    Icons.person_outline,
                    size: 40,
                  )),
              IconButton(
                  color: unselectedColor,
                  onPressed: (() {}),
                  icon: Icon(
                    Icons.favorite_border,
                    size: 40,
                  )),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xffffb800),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "3",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    Navigator.pushReplacementNamed(context, "/cart");
                  });
                },
              )
            ],
          ),
        ));
  }
}
