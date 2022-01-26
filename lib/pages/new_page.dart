import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Page"),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              children: [
                Container(width: 200,color: Colors.red,),
                Container(width: 200,color: Colors.yellow,),
                Container(width: 200,color: Colors.green,),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 145,
            child: PageView(
              children: [
                Container(
                  child: ListView(
                    children: [
                      Container(height: 250,color: Colors.red,),
                      Container(height: 250,color: Colors.blue,),
                      Container(height: 250,color: Colors.grey,),
                      Container(height: 250,color: Colors.yellow,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
