import 'package:flutter/material.dart';
import 'package:foodapp/constants.dart';
import 'package:foodapp/custom_classes.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<int> count = [1, 1, 1];
  late int finalPrice;
  void updateFinalPrice() {
    finalPrice = 400 * count[0] + 150 * count[1] + 50 * count[2];
  }

  @override
  void initState() {
    super.initState();
    updateFinalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "3 towards at cart",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  FoodQuantityCard(
                    quantity: count[0],
                    name: "Couscous",
                    img: "couscous.jpeg",
                    price: 400,
                    onPressedMinus: () {
                      setState(() {
                        if (count[0] > 0) count[0]--;
                        updateFinalPrice();
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        count[0]++;
                        updateFinalPrice();
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FoodQuantityCard(
                    quantity: count[1],
                    name: "Baghrir",
                    img: "baghrir.jpg",
                    price: 150,
                    onPressedMinus: () {
                      setState(() {
                        if (count[1] > 0) count[1]--;
                        updateFinalPrice();
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        count[1]++;
                        updateFinalPrice();
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FoodQuantityCard(
                    quantity: count[2],
                    name: "9alb Louz",
                    img: "9alblouz.jpg",
                    price: 50,
                    onPressedMinus: () {
                      setState(() {
                        if (count[2] > 0) count[2]--;
                        updateFinalPrice();
                      });
                    },
                    onPressedPlus: () {
                      setState(() {
                        count[2]++;
                        updateFinalPrice();
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: selectedColor),
                child: Center(
                  child: Text(
                    "Total: $finalPrice,00 DA",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                color: unselectedColor,
                onPressed: (() {
                  Navigator.pushReplacementNamed(context, "/");
                }),
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
                    color: selectedColor,
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
            )
          ],
        ),
      ),
    );
  }
}

class FoodQuantityCard extends StatelessWidget {
  FoodQuantityCard(
      {required this.img,
      required this.name,
      required this.price,
      required this.quantity,
      required this.onPressedMinus,
      required this.onPressedPlus});

  String img;
  String name;
  int price;
  int quantity;
  late int finalPrice = quantity * price;
  void Function() onPressedMinus;
  void Function() onPressedPlus;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffefefef),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("$finalPrice" + ",00 DA",
                            style: TextStyle(
                                color: goldenColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xffefefef)),
                      child: Column(
                        children: [
                          MyFloatingButton(
                            heroTag: "$name"+"plus",
                            icon: Icons.add,
                            onPressed: onPressedPlus,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "$quantity",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: selectedColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          MyFloatingButton(
                            heroTag: "$name"+"minus",
                            icon: Icons.remove,
                            onPressed: onPressedMinus,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 5,
                offset: Offset(0, 1))
          ]),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("images/$img"),
          ),
        ),
      ],
    );
  }
}
