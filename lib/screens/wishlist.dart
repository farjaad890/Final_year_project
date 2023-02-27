import 'package:flutter/material.dart';
import 'dart:core';
import 'package:navigation/screens/home.dart';
import 'package:navigation/models/categories.dart';
import 'package:navigation/screens/cproducts.dart';
import 'package:navigation/models/products.dart';
import 'package:navigation/screens/cpproducts1.dart';

class wishlist extends StatefulWidget {
  const wishlist({Key? key}) : super(key: key);
  @override
  State<wishlist> createState() => _wishlistState();
}
class _wishlistState extends State<wishlist> {

  late String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Color(0xFF45F1B9),
        title: Center(
          child: Text('Categories',
            style: TextStyle(
              color: Colors.black
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder:(BuildContext context,int index){
          return Card(child: ListTile(title: Text(categories[index].name,
             ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => cpproducts1(categories[index].prod),),
              );
            },
            ),
          );
        },
      ),
    );
  }
}



