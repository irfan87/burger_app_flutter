import 'package:burger_app_flutter/burgers_mini_list.dart';
import 'package:flutter/material.dart';

class BurgerPage extends StatefulWidget {
  static const tag = "burger_page";

  @override
  _BurgerPageState createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  Widget chickenBurgerImage = Container(
    height: 110.0,
    child: Image.asset("images/chicken_burger.png"),
  );

  Widget baconCheeseBurgerImage = Container(
    height: 135.0,
    child: Image.asset("images/bacon_cheeseburger.png"),
  );

  int burgerQuantity = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Object? nameArgument = ModalRoute.of(context)?.settings.arguments;
    bool lightMode = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white70,
              radius: 15.0,
              child: CircleAvatar(
                backgroundImage: AssetImage("images/white_cat.png"),
                radius: 13.0,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameArgument.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Deliver Me BURGER. Fast Delivery & Great Service!",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white54,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    nameArgument == "Chicken Burger"
                        ? chickenBurgerImage
                        : baconCheeseBurgerImage,
                    Spacer(),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Text(
                            "15.95 \$ CAN",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(45),
          ),
        ),
        onClosing: () {},
        builder: (context) {
          return ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(45),
            ),
            child: Container(
              width: size.width,
              height: size.height / 1.6,
              color: lightMode
                  ? Color.fromRGBO(240, 240, 240, 1)
                  : Color.fromRGBO(20, 20, 20, 1),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 28.0,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus gravida quis blandit turpis cursus. In metus vulputate eu scelerisque felis imperdiet proin fermentum. Amet volutpat consequat mauris nunc congue nisi vitae suscipit tellus. Diam maecenas sed enim ut sem viverra aliquet eget.",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  BurgersMiniList(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color:
                                Theme.of(context).primaryColor.withOpacity(.2),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    burgerQuantity--;
                                  });
                                },
                                icon: Icon(Icons.remove_circle),
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Text(burgerQuantity.toString()),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    burgerQuantity++;
                                  });
                                },
                                icon: Icon(Icons.add_circle),
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 45.0,
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: MaterialButton(
                              color: Theme.of(context).colorScheme.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45.0),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Order",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
