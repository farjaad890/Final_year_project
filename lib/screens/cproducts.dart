import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:navigation/models/categories.dart';
import 'package:navigation/models/products.dart';
import 'package:navigation/screens/wishlist.dart';

class cproducts extends StatefulWidget {
  final List<product> ind;
  const cproducts({Key? key, required this.ind}) : super(key: key);
  @override
  State<cproducts> createState() => _cproductsState();
}

class _cproductsState extends State<cproducts> {
  late List<product> products= widget.ind;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Cart')),
        backgroundColor: Color(0xFF45F1B9),
      ),
      backgroundColor: Color(0xFFA7FFEB),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products.length ,
              itemBuilder:(BuildContext context,int index){
                return Card(child: ListTile(title: Text(products[index].name,),
                  onTap: (){},
                ),
                );
              },
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  height: 50,
                  color: Colors.blue,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}