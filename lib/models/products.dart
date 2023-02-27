import 'package:flutter/material.dart';
import 'package:navigation/models/categories.dart';
import 'dart:core';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:navigation/models/products.dart';
class product  {
  late String name,pbrand,weight;
  late int price,position,quantity,saleprice;
  int iteminlist=0;
  final priority_getter=TextEditingController();

  product(String name,String size,int price,int position,String brand,int Quantity,int saleprice){
    this.name=name;
    this.weight=size;
    this.price=price;
    this.position=position;
    this.pbrand=brand;
    this.quantity=Quantity;
    this.saleprice=saleprice;
  }
}
List<product>Totalproducts=[];
List<dynamic> _values = [];
dynamic loadData() async{
  final DatabaseReference dbref = FirebaseDatabase.instance.ref();
  // List<dynamic> _values = [];
  dbref.child("StoreDatabase").get();
  print('Hello from collecting data');
  dbref.child("StoreDatabase").onValue.map((event) => event.snapshot).listen((snapshot) {
    print(snapshot.value);
    print('hello to map');
    final data = snapshot.value as Map<dynamic, dynamic>;
    print(data.length);
    print('hello from list');
    _values = data.values.toList();
    print("Error check");
    for(int i=0;i<_values.length;i++){
      final value = _values[i];
      final product p = product (
          value['pName'],
          value['weight'],
          value['Pprice'],
          value['PrackNo'],
          value['Pbrand'],
          value['pQuantity'],
        value['pUpdatedSalePrice']
      );
      Totalproducts.add(p);
      print("This is pre length");
      print(Totalproducts[i].name);
      print(Totalproducts[i].pbrand);
      print(Totalproducts.length.toString());
    }
  });
}