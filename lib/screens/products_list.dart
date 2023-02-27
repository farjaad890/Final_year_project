import 'package:flutter/material.dart';
import 'package:navigation/models/global.dart';
import 'package:navigation/models/products.dart';
import 'package:navigation/screens/product_info.dart';
import 'package:navigation/screens/cart.dart';

class products_list extends StatefulWidget {
  const products_list({Key? key}) : super(key: key);
  @override
  State<products_list> createState() => _products_listState();
}
class _products_listState extends State<products_list> {
  void toAdd(product item){
    setState(() {
      if(cart.isEmpty){
        cart.add(item);
        totalitems++;
        item.iteminlist++;
        if(item.saleprice==0) {
          total = item.price + total;
        }
        else{
          total=item.price+total;
        }
      }
      else{
        if(cart.contains(item)){
          totalitems++;
          item.iteminlist++;
          if(item.saleprice==0) {
            total = item.price + total;
          }
          else{
            total=item.saleprice+total;
          }
        }
        else{
          cart.add(item);
          totalitems++;
          item.iteminlist++;
          if(item.saleprice==0) {
            total = item.price + total;
          }
          else{
            total=item.saleprice+total;
          }
        }
      }

    });
  }
  void toSubtract(product item){
    setState(() {
      if(cart.isEmpty){

      }
      else{
        if(cart.contains(item)){
          totalitems--;
          item.iteminlist--;
          if(item.saleprice==0) {
            total =total-item.price;
          }
          else{
            total=total - item.saleprice;
          }
          if(item.iteminlist==0)
          {
            cart.remove(item);
          }
        }
      }
    });
  }
  List<product> _filteredProducts = Totalproducts;
  TextEditingController _searchBarController = TextEditingController();
  void _searchProducts(String query) {
    setState(() {
      _filteredProducts = Totalproducts.where((product) =>
          product.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }
  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    print(Totalproducts.length);
    print(_filteredProducts.length);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF45F1B9),
        actions:<Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 20,
                width: 40,
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: (){
                    if(cart.isNotEmpty){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => cartlist(ind: cart, Total: total),),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Center(child: LayoutBuilder(builder: (context, constraints) {
                  if(totalitems == 0 || check==0){
                    return Center(
                      child: Text("Price : ${total}",
                          key:PageStorageKey(total),
                      ),
                    );
                  }else{
                    check=0;
                    return Center(
                      child: Text("Total : ${total}",
                        key:PageStorageKey(total),
                      ),
                    );
                  }
                }
                ),
                ),
              ),
            ],
          ),
        ],
        title: Center(
          child: Row(
            children: [
              Expanded(
                  child:TextField(
                    controller: _searchBarController,
                    decoration: InputDecoration(
                        hintText: 'Search products',
                        border: InputBorder.none
                    ),
                    onChanged: (value) {
                      _searchProducts(value);
                    },
                  ),
              ),
            ],
          ),
        ),
      ),

      backgroundColor: Color(0xFFA7FFEB),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount:_filteredProducts.length ,
        itemBuilder:(BuildContext context,int index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => product_info(prod: _filteredProducts[index]),),
              );
            },
            child: Card(
              color: _filteredProducts[index].quantity > 0 ? Colors.white : Colors.red,
              child: Row(
                children: [
                  Text(_filteredProducts[index].name),
                  Spacer(
                    flex: 1,
                  ),
                  ElevatedButton(onPressed:_filteredProducts[index].quantity==0 ? null : (){toAdd(_filteredProducts[index]);
                  check=1;
                  print(totalitems);
                  print(total);
                  },
                    child: Icon(
                      Icons.add,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                      height: 15,
                      width: 15,
                      child: _filteredProducts[index].iteminlist ==0 ?Center(child: Text(" "),) :Center(child: Text(_filteredProducts[index].iteminlist.toString(),key:PageStorageKey(_filteredProducts[index].iteminlist.toString()),))
                  ),
                  ElevatedButton(onPressed: _filteredProducts[index].quantity== 0 ? null:(){toSubtract(_filteredProducts[index]);
                    check=1;
                  print(totalitems);
                  print(total);
                  },
                    child: Icon(
                      Icons.minimize,
                      color: Colors.lightGreen,
                    ),
                  ),
                  Container(
                    height: 15,
                    width: 50,
                    child: Center(
                      child: Text(_filteredProducts[index].saleprice==0 ? '\Rs.${_filteredProducts[index].price.toString()}':'\Rs.${_filteredProducts[index].saleprice.toString()}'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
