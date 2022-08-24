import 'package:flutter/material.dart';
import 'constants.dart';

class FoodCard extends StatelessWidget {
  FoodCard(
      {required this.name,
      required this.img,
      required this.price,
      required this.onTap});
  void Function() onTap;
  String name;
  String img;
  String price;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 165,
              padding: EdgeInsets.fromLTRB(15, 15, 15, 40),
              child: Column(
                children: [
                  Hero(
                    tag: img,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/$img"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$price" + ",00 DA",
                    style: TextStyle(
                        color: goldenColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Color(0xffefefef),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
      FloatingActionButton.small(
          heroTag: name,
          child: Icon(
            Icons.add,
            size: 30,
          ),
          backgroundColor: selectedColor,
          onPressed: (() {})),
    ]);
  }
}

class MyTab extends StatelessWidget {
  MyTab(
      {required this.img,
      required this.label,
      required this.onTap,
      required this.selectedTab,
      required this.num});
  int num;
  String label;
  String img;
  int selectedTab;

  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color:
                    num == selectedTab ? Color(0xFF6b45bc) : Color(0xffefefef),
              ),
              width: 70,
              height: 70,
              child: Image(
                image: AssetImage("images/$img"),
              )),
          onTap: onTap,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(
            fontWeight: num == selectedTab ? FontWeight.w700 : FontWeight.w400,
            color: num == selectedTab ? Colors.black : Color(0xffc7c7c7),
            fontSize: num == selectedTab ? 17 : 16,
          ),
        )
      ],
    );
  }
}

class MyFloatingButton extends StatelessWidget {
  MyFloatingButton({required this.icon, required this.onPressed,this.heroTag});
  IconData icon;
  Object? heroTag;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      child: FittedBox(
        child: FloatingActionButton(
            heroTag: heroTag,
            child: Icon(
              icon,
              size: 35,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            onPressed: onPressed),
      ),
    );
  }
}
