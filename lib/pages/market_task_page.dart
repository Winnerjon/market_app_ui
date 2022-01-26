import 'package:flutter/material.dart';
import 'package:market_app_ui/models/product_model.dart';

class MarketTaskPage extends StatefulWidget {
  static const String id = "market_task_page";

  const MarketTaskPage({Key? key}) : super(key: key);

  @override
  _MarketTaskPageState createState() => _MarketTaskPageState();
}

class _MarketTaskPageState extends State<MarketTaskPage> {
  List<String> _categories = ["All", "Red", "Blue", "Green", "Black", "White"];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        toolbarHeight: 80,
        elevation: 0,
        title: Text(
          "Cars",
          style: TextStyle(
            color: Colors.red,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.red,
              size: 25,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.red,
              size: 25,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //#categories
            Container(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return itemOfCategory(index);
                  }),
            ),
            //#products
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: ItemList.listItem.length,
              itemBuilder: (context, index) {
                return itemOfproduct(ItemList.listItem[index]);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget itemOfproduct(Product products) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(products.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.75),
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.3),
            ]),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      products.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      products.type,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${products.cost}\$",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: MaterialButton(
                      minWidth: 35,
                      height: 35,
                      color: Colors.red,
                      shape: CircleBorder(),
                      onPressed: () {
                        setState(() {
                          products.isLike = !products.isLike;
                        });
                      },
                      child: products.isLike
                          ? Icon(
                              Icons.favorite_outlined,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container itemOfCategory(int index) {
    return Container(
      padding: (index != _categories.length - 1)
          ? EdgeInsets.only(left: 5)
          : EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        elevation: 0,
        shape: StadiumBorder(),
        color: (_selectedIndex == index) ? Colors.red : Colors.white,
        child: Text(
          _categories[index],
          style: TextStyle(
              fontSize: 17,
              color: (_selectedIndex == index) ? Colors.white : Colors.black),
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}