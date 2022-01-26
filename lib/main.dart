import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_app_ui/pages/basket_page.dart';
import 'package:market_app_ui/pages/home_page.dart';
import 'package:market_app_ui/pages/market_page.dart';
import 'package:market_app_ui/pages/market_task_page.dart';
import 'package:market_app_ui/pages/new_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        HomePage.id:(context)=>HomePage(),
        MarketUiPage.id:(context)=>MarketUiPage(),
        MarketTaskPage.id:(context)=>MarketTaskPage(),
        BasketPage.id:(context)=>BasketPage(),
      },
    );
  }
}
