import 'package:burger_app_flutter/burger_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BurgersList extends StatefulWidget {
  final int row;

  BurgersList({required this.row});

  @override
  _BurgersListState createState() => _BurgersListState();
}

class _BurgersListState extends State<BurgersList> {
  @override
  Widget build(BuildContext context) {
    int items = 10;

    Widget chickenBurgerImage = Container(
      height: 110.0,
      child: Image.asset("images/chicken_burger.png"),
    );

    Widget baconCheeseBurgerImage = Container(
      height: 160.0,
      child: Image.asset("images/bacon_cheeseburger.png"),
    );

    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 330.0 : 240.0,
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            bool reverse = widget.row == 2 ? index.isEven : index.isOdd;

            return Stack(
              children: [
                Container(
                  height: 240.0,
                  width: 200.0,
                  margin: EdgeInsets.only(
                    left: 20.0,
                    right: index == items ? 20.0 : 0.0,
                  ),
                  child: GestureDetector(
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            Text(
                              reverse ? "Chicken Burger" : "Bacon Burger",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  "15.95 \$ CAN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      elevation: 3,
                      margin: EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45.0),
                          bottomRight: Radius.circular(15.0),
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        BurgerPage.tag,
                        arguments: reverse ? "Chicken Burger" : "Bacon Burger",
                      );
                    },
                  ),
                ),
                Positioned(
                  top: reverse ? 75.0 : 50.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        BurgerPage.tag,
                        arguments: reverse ? "Chicken Burger" : "Bacon Burger",
                      );
                    },
                    child:
                        reverse ? chickenBurgerImage : baconCheeseBurgerImage,
                  ),
                ),
              ],
            );
          },
          itemCount: items,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
