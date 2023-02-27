import 'package:flutter/material.dart';
import 'package:navigation/models/products.dart';
class product_info extends StatelessWidget {
   final product prod;
  const product_info({Key? key, required this.prod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('${prod.name}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title:Text('Product Name : ${prod.name}'),
          ),
          ListTile(
            title:Text('Product Price : ${prod.price.toString()}'),
          ),
          ListTile(
            title:Text('Product Weight : ${prod.weight.toString()}'),
          ),
          ListTile(
            title:Text('Product Brand :${prod.pbrand}'),
          ),
          ListTile(
            title:Text('Product Saleprice :${prod.saleprice}'),
          )
        ],
      ),
    );
  }
}
