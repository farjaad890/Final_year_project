import 'package:flutter/material.dart';
import 'package:navigation/models/categories.dart';
import 'package:navigation/models/products.dart';

import '../models/global.dart';

class shelf extends StatefulWidget {
  late int? id=0 ;
   shelf({Key? key,this.id}) : super(key: key);

  @override
  State<shelf> createState() => _shelfState();
}

class _shelfState extends State<shelf> {
  late int? id=widget.id;
  late List<product> addprod=[];
  @override
  void initState(){
    for(int i=0;i<Totalproducts.length;i++)
      {
        if(id==Totalproducts[i].position)
        {
          addprod.add(Totalproducts[i]);
        }
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shelf"),
      ),
      body: Container(
        child:ListView.builder(
          shrinkWrap: true,
          itemCount: addprod.length ,
          itemBuilder:(BuildContext context,int index){
            return Card(child: ListTile(title: Text(addprod[index].name,),
              onTap: (){},
            ),
            );
          },
        ),
      ),
    );
  }
  
  }