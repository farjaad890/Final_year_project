import 'package:flutter/material.dart';
import 'package:navigation/screens/wishlist.dart';
import 'package:navigation/models/global.dart';
import 'package:navigation/screens/cart.dart';
import 'package:navigation/screens/products_list.dart';
import 'package:navigation/screens/Login.dart';
class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:<Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()));
            },
          )
        ],
        title: Center(child:Text("Welcome"),),
        backgroundColor: Color(0xFF45F1B9),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xFFA7FFEB),
      body: SafeArea(
        child:Stack(
          children: [
            Container(
              constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/made3.png"),
                    fit: BoxFit.fill
                ),
              ),
            ),
            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child:Image(image: AssetImage('images/logo2c.png',
                  ),
                    width: 250.0,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                    height: 50.0,
                    width:250.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if(cart.isEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => products_list(),),
                          );
                        }
                        else{
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => cartlist(ind : cart, Total: total,),),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF45F1B9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('create wishlist',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    )
                ),
              ],
            ),
      ),
          ],
        ),
      ),
    );
  }
}
