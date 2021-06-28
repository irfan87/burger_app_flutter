import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BurgersMiniList extends StatefulWidget {
  @override
  _BurgersMiniListState createState() => _BurgersMiniListState();
}

class _BurgersMiniListState extends State<BurgersMiniList> {
  Widget chickenBurgerImage = Container(
    height: 80.0,
    child: Image.asset("images/chicken_burger.png"),
  );

  Widget baconCheeseBurgerImage = Container(
    height: 110.0,
    child: Image.asset("images/bacon_cheeseburger.png"),
  );

  int burgerCounts = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      margin: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          bool reverse = index.isEven;

          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120.0,
                    height: 120.0,
                    margin: EdgeInsets.only(
                      left: 20.0,
                      right: index == burgerCounts ? 20.0 : 0,
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        elevation: 3.0,
                        margin: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: Text(
                      reverse ? "Chicken Burger" : "Bacon Burger",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: reverse ? 20.0 : 5.0,
                left: reverse ? 10.0 : 15.0,
                child: GestureDetector(
                  onTap: () {},
                  child: reverse ? chickenBurgerImage : baconCheeseBurgerImage,
                ),
              ),
            ],
          );
        },
        itemCount: burgerCounts,
      ),
    );
  }
}
