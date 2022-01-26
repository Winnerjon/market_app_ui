import 'package:flutter/material.dart';
import 'package:market_app_ui/models/product_model.dart';

class BasketPage extends StatefulWidget {
  static const String id = "basket_page";

  const BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < ItemList.likedList.length; i++) {
      total = total + ItemList.likedList[i].cost;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.west_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Basket",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: ItemList.likedList.length,
              itemBuilder: (context, index) {
                return itemOfProducts(ItemList.likedList[index]);
              },
            ),
            SizedBox(
              height: 50,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.greenAccent,
              child: ListTile(
                title: Text(
                  "Total:",
                  style: TextStyle(color: Colors.purpleAccent, fontSize: 23),
                ),
                trailing: Text(
                  "$total\$",
                  style: TextStyle(fontSize: 21),
                ),
              ),
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
}
