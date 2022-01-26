import 'package:flutter/material.dart';

class Product {
  int cost;
  String name;
  String type;
  String image;
  String color;
  bool isLike = false;

  Product(
      {required this.name,
      required this.cost,
      required this.type,
      required this.image,
      required this.color});
}

class ItemList{
  static List<Product> listItem = [
    Product(
      name: "PDP Car",
      cost: 100,
      type: "Electric",
      image: "assets/images/img.png",
      color: "red",
    ),
    Product(
      name: "PDP Car",
      cost: 100,
      type: "Electric",
      image: "assets/images/img_1.png",
      color: "blue",),
    Product(
      name: "PDP Car",
      cost: 100,
      type: "Electric",
      image: "assets/images/img_2.png",
      color: "yellow",),
    Product(
      name: "PDP Car",
      cost: 100,
      type: "Electric",
      image: "assets/images/img_3.png",
      color: "white",),
    Product(
      name: "PDP Car",
      cost: 100,
      type: "Electric",
      image: "assets/images/img_4.png",
      color: "green",),

  ];

  static List<Product> likedList = [];
  int sum = 0;
}
