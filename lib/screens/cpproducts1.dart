import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:navigation/models/categories.dart';
import 'package:navigation/models/products.dart';
import 'package:navigation/screens/product_info.dart';
import 'package:navigation/screens/wishlist.dart';
import 'package:navigation/screens/cproducts.dart';
import 'package:navigation/models/global.dart';
import 'package:navigation/screens/cart.dart';


class cpproducts1 extends StatefulWidget {
 late List<product> prod;
   cpproducts1( this.prod, {Key? key}) : super(key: key);

  @override
  State<cpproducts1> createState() => _cpproducts1State();
}

class _cpproducts1State extends State<cpproducts1> {
 //  @override
 //  void initState(){
 //    loadData();
 //  }
 // dynamic loadData() async{
 //    final DatabaseReference dbref = FirebaseDatabase.instance.ref();
 //    List<dynamic> _values = [];
 //    dbref.child("StoreDatabase").get();
 //    print('Hello from collecting data');
 //    dbref.child("StoreDatabase").onValue.map((event) => event.snapshot).listen((snapshot) {
 //      print(snapshot.value);
 //      print('hello to map');
 //      final data = snapshot.value as Map<dynamic, dynamic>;
 //      print(data.length);
 //      print('hello from list');
 //      _values = data.values.toList();
 //      for (int i = 0; i < _values.length; i++) {
 //        final value = _values[i];
 //        // access individual values
 //        print(value['pName']);
 //      }
 //    });
 //
 //    //
 //    // List<product> products = [];
 //    //
 //    // data.forEach((key, value) {
 //    //   final product p = product(
 //    //       value["name"],
 //    //       value["id"],
 //    //       value["weight"],
 //    //       value["price"],
 //    //       value["position"]
 //    //   );
 //    //   products.add(p);
 //    // });
 //  }
  int calTotal(){
    int tot=0;
    for(int i=0;i<cart.length;i++)
      {
        tot=(cart[i].price*cart[i].iteminlist)+tot;
      }
    return tot;
  }
  void toAdd(product item){
    if(cart.isEmpty){
      cart.add(item);
      item.iteminlist++;
    }
    else{
      if(cart.contains(item))
        {
          item.iteminlist++;
        }
      else{
        cart.add(item);
        item.iteminlist++;
      }
    }
  }
  void incrementcounter(){
    setState(() {
      totalitems++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF45F1B9),
        title: Center(child: LayoutBuilder(builder: (context, constraints) {
          if(totalitems == 0 || check==0){
            return Center(
              child: Text("Total : $total",
                style: TextStyle(
                    fontSize: 35
                ),
              ),
            );
          }else{
            check=0;
            return Center(
              child: Text("Total : ${total=calTotal()}",
                style: TextStyle(
                    fontSize: 35
                ),
              ),
            );
          }
        }
        ),
        ),
      ),
      backgroundColor: Color(0xFFA7FFEB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount:widget.prod.length ,
            itemBuilder:(BuildContext context,int index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => product_info(prod: widget.prod[index]),),
                  );
                },
                child: Card(

                child: Row(
                  children: [
                        Text(widget.prod[index].name),
                    Spacer(
                      flex: 1,
                    ),
                    ElevatedButton(onPressed:(){toAdd(widget.prod[index]);
                      check=1;
                      incrementcounter();
                      },
                      child: Icon(
                          Icons.add,
                        color: Colors.red,
                    ),
                    ),
                    Container(
                        height: 15,
                        width: 15,
                        child: Center(child: Text(widget.prod[index].iteminlist.toString()))
                    ),
                    ElevatedButton(onPressed: null,
                      child: Icon(
                        Icons.minimize,
                        color: Colors.lightGreen,
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 30,
                        child: Center(
                          child: Text('\$${widget.prod[index].price.toString()}'),
                        ),
                    ),
                  ],
                ),
              //   child: ListTile(title: Text(widget.prod[index].name,),
              //   trailing: Text('\$${widget.prod[index].price}'),
              //   onTap: (){
              //     cart.add(widget.prod[index]);
              //     check=1;
              //     incrementcounter();
              //   },
              // ),
              ),
              );
            },
          ),
            SizedBox(
                height: 50.0,
                width:250.0,
                //width: MediaQuery.of(context).size.width,
                child:  ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => cartlist(ind : cart, Total: total,),),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF45F1B9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Cart',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
            ),
        ],
      ),
    );
  }
}
