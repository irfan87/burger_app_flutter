import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double calHeaderHeight = size.height / 5;
    bool lightMode = Theme.of(context).brightness == Brightness.light;

    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    height: calHeaderHeight,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(45.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 2.5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white70,
                              radius: 35.0,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("images/white_cat.png"),
                                radius: 30.0,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  "John Doe",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.black54,
                                  ),
                                  child: Text(
                                    "Gold Member",
                                    style: TextStyle(
                                      color: Colors.yellow[700],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              "154 \$ CAN",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  height: 50.0,
                  width: size.width,
                  child: Card(
                    color:
                        lightMode ? Colors.white : Theme.of(context).cardColor,
                    elevation: 3.0,
                    margin: EdgeInsets.symmetric(
                      horizontal: 50.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "What do you want to eat?",
                        suffixIcon: Icon(
                          Icons.search,
                          color: lightMode ? Colors.black54 : Colors.white60,
                        ),
                        contentPadding: EdgeInsets.only(left: 20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
