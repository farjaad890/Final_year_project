import 'package:flutter/material.dart';
import 'package:navigation/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/person.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  FirebaseAuth _auth=FirebaseAuth.instance;
  final emailcontroler = TextEditingController();
  final passwordcontroler = TextEditingController();
  bool isLoading = false;

  loggingin() async {
    try {
      String emailadress = emailcontroler.text.trim(),
          Pasword = passwordcontroler.text.trim();
      if (emailcontroler == null && passwordcontroler == null) {
        print('Email & pasword is empty');
      } else {
        setState(() {
          isLoading=true;
        });
        UserCredential checkUser = await _auth.signInWithEmailAndPassword(email: emailadress, password: Pasword);
        final user = checkUser.user;
        if (user != null) {
          print("this is email start");
          print(user.email);
          print("This is email end");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => home(),),
          );
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('email or password incorrect')),
          );
        }
      }
    } catch (e) {
      setState(() {
        isLoading=false;
      });
      print(e);
      showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                      title: const Text("Alert Dialog Box"),
                      content: Text(e.toString()),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          }, child: Container(
                          color: Color(0xFFA7FFEB),
                          padding: const EdgeInsets.all(14),
                          child: const Text("okay"),
                        ),
                        )
                      ]
                  )
              );
    }
  }

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
              child: isLoading ? CircularProgressIndicator() : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: Container(
                      child: Icon(
                        Icons.shopping_cart,
                        color: Color(0xFFA7FFEB),
                        size: 50.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Material(
                    elevation: 2.5,
                    child: Container(
                        height: 50.0,
                        width:300.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFA7FFEB),
                        ),
                        child:TextField(
                          controller: emailcontroler,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Center(child: Text('example@gmail.com')),
                          ),
                        ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.5,
                    child: Container(
                      height: 50.0,
                      width:300.0,
                      color: Color(0xFFA7FFEB),
                      child:TextField(
                        controller: passwordcontroler,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          hoverColor: Colors.white,
                          label: Center(child: Text('Password')),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                      height: 50.0,
                      width:250.0,
                      child: ElevatedButton(
                        onPressed: () {
                          loggingin();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => home()),
                          // );
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
