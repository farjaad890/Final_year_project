import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:navigation/models/categories.dart';
import 'package:navigation/models/global.dart';
import 'package:navigation/models/products.dart';
import 'package:navigation/screens/addpriorty.dart';
import 'package:navigation/screens/floorscreen.dart';
import 'package:navigation/screens/floorscreen2.dart';
import 'package:navigation/screens/wishlist.dart';

class cartlist extends StatefulWidget {
  final List<product> ind;
  final int Total;
  const cartlist({Key? key, required this.ind, required this.Total}) : super(key: key);

  @override
  State<cartlist> createState() => _cartlistState();
}

class _cartlistState extends State<cartlist> {
  late List<product> products= widget.ind;
  late int total=widget.Total;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
      _selectedIndex = index;
      if(_selectedIndex==0)
        {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => Floor2(title: total, ind: products),),
          );
        }
      if(_selectedIndex==1)
        {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => priority(items: cart, total: total),),
          );
        }
  }
  void toSubtract(product item){
    setState(() {
      if(cart.isEmpty){

      }
      else{
        if(cart.contains(item)){
          totalitems--;
          item.iteminlist--;
          total=total-item.price;
          if(item.iteminlist==0)
          {
            cart.remove(item);
          }
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Cart : $total')),
        backgroundColor: Color(0xFF45F1B9),
      ),
      backgroundColor: Color(0xFFA7FFEB),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: products.length ,
        itemBuilder:(BuildContext context,int index){
          return Card(child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text(products[index].name),
          Spacer(

          ),
          Text(products[index].iteminlist.toString()),
          SizedBox(
            width: 80,
          ),
          ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF45F1B9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: (){
                  toSubtract(products[index]);
                },
                child: Text("Remove")
            ),

            ],
          // ), ListTile(title: Text(products[index].name,),
          //   onTap: (){},
          //   trailing: ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //         primary: Color(0xFF45F1B9),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(12),
          //         ),
          //       ),
          //       onPressed: (){},
          //       child: Text("Remove")
          //   ),
          // ),
          )
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items:
          <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.assistant_navigation),
              label: 'navigate',
              backgroundColor: Colors.red,

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'priority',
              backgroundColor: Colors.green,
            ),
          ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
