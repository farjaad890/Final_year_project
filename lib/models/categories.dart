import 'package:flutter/material.dart';
import 'dart:core';
import'package:navigation/models/products.dart';
import 'package:flutter/material.dart';
import 'package:navigation/models/categories.dart';
import 'dart:core';

class category {
  late String name;
  late int categoryid;
  List<product> prod=[];

  category(String nam,int id,List<product> prod){
    this.name=nam;
    this.categoryid=id;
    this.prod=prod;
  }
}
//   CollectionReference _collectionRef = FirebaseFirestore.instance.collection('Categories');
// Future<void> getData() async {
//   // Get docs from collection reference
//   QuerySnapshot querySnapshot = await _collectionRef.get();
//
//   // Get data from docs and convert map to List
//   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//   print('Hello from categories');
//   print(allData);
// }

List<category> categories=[
  // category('meat', 0,meatproducts),
  // category('frozen', 1,frozenproducts),
  // category('sweet', 2,swwetproducts),
];