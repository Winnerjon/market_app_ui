import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app_ui/models/product_model.dart';
import 'package:market_app_ui/pages/basket_page.dart';

class MarketUiPage extends StatefulWidget {
  static const String id = "marketui_page";

  const MarketUiPage({Key? key}) : super(key: key);

  @override
  _MarketUiPageState createState() => _MarketUiPageState();
}

class _MarketUiPageState extends State<MarketUiPage> {
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
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {},
          ),
          Container(
            width: 50,
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(BasketPage.id);
                  },
                ),
                ItemList().sum != 0
                    ? CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Text(
                          "${ItemList().sum}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    : Text(""),
              ],
            ),
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
                return itemOfProducts(ItemList.listItem[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget itemOfProducts(Product products) {
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
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          products.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          products.type,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "${products.cost}\$",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 15, right: 10),
                  alignment: Alignment.topRight,
                  child: MaterialButton(
                    minWidth: 35,
                    height: 35,
                    color: Colors.white,
                    shape: CircleBorder(),
                    onPressed: () {
                      setState(() {
                        products.isLike = !products.isLike;

                        products.isLike ? ItemList().sum++ : ItemList().sum--;

                        products.isLike
                            ? ItemList.likedList.add(products)
                            : ItemList.likedList.remove(products);
                      });
                    },
                    child: products.isLike
                        ? Icon(
                            Icons.favorite_outlined,
                          )
                        : Icon(
                            Icons.favorite_outline,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemOfCategory(int index) {
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
        color: (_selectedIndex == index) ? Colors.grey.shade200 : Colors.white,
        child: Text(
          _categories[index],
          style: TextStyle(fontSize: 17),
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
