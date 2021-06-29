import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentSelectedItem = 0;

  @override
  Widget build(BuildContext context) {
    int items = 10;
    bool lightMode = Theme.of(context).brightness == Brightness.light;

    return SliverToBoxAdapter(
      child: Container(
        height: 100.0,
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items,
          itemBuilder: (context, index) => Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 90.0,
                    width: 90.0,
                    margin: EdgeInsets.only(
                      left: index == 0.0 ? 20.0 : 0.0,
                      right: 20.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentSelectedItem = index;
                        });
                      },
                      child: Card(
                        color: index == currentSelectedItem
                            ? lightMode
                                ? Colors.black.withOpacity(0.7)
                                : Colors.teal
                            : lightMode
                                ? Colors.white
                                : Theme.of(context).cardColor,
                        child: Icon(
                          Icons.fastfood,
                          color: index == currentSelectedItem
                              ? Colors.white
                              : lightMode
                                  ? Colors.black.withOpacity(0.7)
                                  : Colors.white,
                        ),
                        elevation: 3.0,
                        margin: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  margin: EdgeInsets.only(
                    left: index == 0.0 ? 20.0 : 0.0,
                    right: 20.0,
                  ),
                  width: 90.0,
                  child: Row(
                    children: [
                      Spacer(),
                      Text("Burger $index"),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
