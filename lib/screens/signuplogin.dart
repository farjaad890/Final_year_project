import 'package:flutter/material.dart';
import 'package:navigation/screens/Login.dart';
import 'package:navigation/screens/Signup.dart';

class signuplogin extends StatefulWidget {
  const signuplogin({Key? key}) : super(key: key);

  @override
  State<signuplogin> createState() => _signuploginState();
}

class _signuploginState extends State<signuplogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
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
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: Container(
                      child: Icon(
                        Icons.shopping_cart,
                        color: Color(0xFF64FFDA),
                        size: 50.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    width:250.0,
                    child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => login ()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF45F1B9),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                              ),
                          ),
                          child: Text('Login',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                      )
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                      height: 50.0,
                      width:250.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signup ()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF45F1B9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
