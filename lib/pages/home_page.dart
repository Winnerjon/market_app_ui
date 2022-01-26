import 'package:flutter/material.dart';
import 'package:market_app_ui/pages/market_page.dart';
import 'package:market_app_ui/pages/market_task_page.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        centerTitle: true,
        title: Text("Home"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              height: 45,
              minWidth: 250,
              color: Colors.greenAccent.shade400,
              shape: StadiumBorder(),
              onPressed: (){
                Navigator.pushReplacementNamed(context, MarketUiPage.id);
              },
              child: Text("Market UI",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
            SizedBox(height: 20,),
            MaterialButton(
              height: 45,
              minWidth: 250,
              color: Colors.greenAccent.shade400,
              shape: StadiumBorder(),
              onPressed: (){
                Navigator.pushReplacementNamed(context, MarketTaskPage.id);
              },
              child: Text("Market Task",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
